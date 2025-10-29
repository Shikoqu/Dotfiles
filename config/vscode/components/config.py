from dataclasses import dataclass
from pathlib import Path
from typing import Any
import json
import toml

from .generate_vscode_settings_json import generate_vscode_settings_json


type Settings = dict[str, Any]


@dataclass
class Config:
    name: str
    settings: Settings = None
    parents: list["Config"] = None
    profile_location_dir: Path = None

    @staticmethod
    def load(file: Path, *, loaded: list[str] = None) -> "Config":
        loaded = loaded or []

        settings: Settings = {}
        with file.open() as f:
            settings = toml.load(f)

        metadata: Settings = settings.pop("metadata", {})
        name = Config.load_name(metadata, file, loaded)
        parents = Config.load_parents(metadata, file, loaded)

        return Config(name, settings, parents)

    @staticmethod
    def load_name(
        metadata: Settings, settings_source_file: Path, loaded: list[str]
    ) -> str:
        name = metadata.get("name", settings_source_file.stem)
        if name in loaded:
            raise ValueError(
                f"Settings with name '{name}' already loaded from {settings_source_file}."
            )
        loaded.append(name)
        return name

    @staticmethod
    def load_parents(
        metadata: Settings, settings_source_file: Path, loaded: list[str]
    ) -> list["Config"]:
        parents_files = metadata.get("parents", [])
        parents = []
        for parent_file in parents_files:
            parent_path: Path = (settings_source_file / ".." / parent_file).resolve()
            if not parent_path.exists() or not parent_path.is_file():
                raise FileNotFoundError(
                    f"Parent settings file '{parent_path}' does not exist."
                )
            parents.append(Config.load(parent_path, loaded=loaded))
        return parents

    @staticmethod
    def load_profile_location(metadata: Settings, settings_source_file: Path) -> Path:
        location = metadata.get("location", settings_source_file.parent)
        path = Path(location).resolve()
        if not path.exists() or not path.is_dir():
            raise FileNotFoundError(
                f"Profile location '{path}' does not exist or is not a directory."
            )
        return path

    @property
    def settings(self) -> Settings:  # noqa: F811
        combined_settings = {}
        for parent in self.parents:
            combined_settings.update(parent.settings)
        combined_settings.update(self._settings)
        return combined_settings

    @settings.setter
    def settings(self, value: Settings):
        self._settings = value

    def get_json(self) -> str:
        return json.dumps(self.settings, indent=2)

    def get_vscode_json(self) -> str:
        return generate_vscode_settings_json(self.settings)

    def check_if_updated(self, file: Path) -> bool:
        with file.open() as f:
            vscode = f.readlines()
        current = self.get_vscode_json().splitlines()

        if current == vscode:
            return False

        def compare_lines(sett1: list[str], sett2: list[str], msg: str) -> bool:
            different = False
            for line in sett1:
                if not line.strip() or line.startswith("//") or line in sett2:
                    continue
                # line from sett1 not in sett2
                different = True
                print(f"{msg}:\n\t{line.strip()}")
            return different

        current_updated = compare_lines(
            current, vscode, "Line from current settings not found in VSCode settings"
        )
        vscode_updated = compare_lines(
            vscode, current, "Line from VSCode settings not found in current settings"
        )

        return current_updated or vscode_updated
