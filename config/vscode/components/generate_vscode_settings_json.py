from typing import Any
import json
import re


INDENT_SIZE: int = 2


def make_indent(indent_level: int) -> str:
    return " " * (indent_level * INDENT_SIZE)


def generate_vscode_settings_json(settings: dict[str, Any]) -> str:
    lines: list[str] = []
    lines.append("// cspell:disable")
    lines.append("{")

    stack_: list[tuple[Any, str, int, bool]] = []

    # --------------------------------------------------------------------------------

    def stack(
        node: Any, *, key: str = "", indent: int = 0, in_list: bool = False
    ) -> None:
        stack_.append((node, key, indent, in_list))

    def process_bracket(bracket_: dict, key: str, indent: int, in_list: bool) -> None:
        nonlocal lines
        lines.append(f"{make_indent(indent)}{bracket_},")

    def process_dict(dict_: dict, key: str, indent: int, in_list: bool) -> None:
        is_conditional = re.match(r"^\[.*\]$", key) is not None

        if not in_list and not is_conditional:
            for k, val in reversed(node.items()):
                new_key = f"{key}.{k}" if key else k
                stack(val, key=new_key, indent=indent)

        else:
            nonlocal lines
            key_str = f"{json.dumps(key)}: " if key else ""
            lines.append(f"{make_indent(indent)}{key_str}{{")

            stack("}", indent=indent)
            for k, val in reversed(node.items()):
                stack(val, key=k, indent=indent + 1)

    def process_list(list_: list, key: str, indent: int, in_list: bool) -> None:
        nonlocal lines
        key_str = f"{json.dumps(key)}: " if key else ""
        lines.append(f"{make_indent(indent)}{key_str}[")

        stack("]", indent=indent)
        for item in reversed(node):
            stack(item, indent=indent + 1, in_list=True)

    def process_literal(
        literal_: str | int | float | bool | None, key: str, indent: int, in_list: bool
    ) -> None:
        if key and in_list:
            raise ValueError("Key cannot be used in a list context.")

        nonlocal lines
        key_str = f"{json.dumps(key)}: " if key else ""
        lines.append(f"{make_indent(indent)}{key_str}{json.dumps(literal_)},")

    # --------------------------------------------------------------------------------

    stack(settings, indent=1)
    while stack_:
        node, *params = stack_.pop()

        match node:
            case "}" | "]" as bracket_:
                process_bracket(bracket_, *params)
            case dict() as dict_:
                process_dict(dict_, *params)
            case list() as list_:
                process_list(list_, *params)
            case str() | int() | float() | bool() | None as literal_:
                process_literal(literal_, *params)
            case _:
                raise TypeError(f"Unsupported type: {type(node)} for node: {node}")

    lines.append("}")
    return "\n".join(lines)
