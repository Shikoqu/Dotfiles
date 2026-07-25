#!/usr/bin/env zsh

# Git helpers migrated from Warp (no agent mode — plain shell only).

_git_local_main_or_master() {
  if git show-ref --verify --quiet refs/heads/main; then
    print -r main
  elif git show-ref --verify --quiet refs/heads/master; then
    print -r master
  else
    print -u2 'git helpers: need a local branch named main or master'
    return 1
  fi
}

_git_worktree_dirty() {
  [[ -n $(git status --porcelain 2>/dev/null) ]]
}

_git_create_new_branch() {
  local mm base=$1
  mm=$(_git_local_main_or_master) || return
  git checkout "$mm" \
    && git pull \
    && git checkout -b "$base" \
    && git push --set-upstream origin "$base"
}

# Empty amend + force-with-lease (e.g. re-trigger Jenkins on same commit).
# Usage: git_commit_empty ["your message"]
git_commit_empty() {
  local msg=${1:-"empty retry"}
  git commit --allow-empty --amend -m "$msg" && git push --force-with-lease
}

# New branch from default base (main or master), tracking origin.
# Stashes WIP (incl. untracked) first, then restores it on the new branch via stash pop.
# Usage: git_new_branch <branch-name>
git_new_branch() {
  [[ -n $1 ]] || { print -u2 'usage: git_new_branch <branch-name>'; return 2 }
  local stashed=0

  if _git_worktree_dirty; then
    git stash push -u -m 'git_new_branch: WIP before branching' || return
    stashed=1
  fi

  _git_create_new_branch "$1" || {
    (( stashed )) && git stash pop
    return 1
  }

  if (( stashed )); then
    git stash pop || {
      print -u2 'git_new_branch: stash pop failed — fix conflicts or use git stash list'
      return 1
    }
  fi
}

# Soft reset current branch to match main/master (keeps your changes staged).
git_reset_soft_main() {
  local mm
  mm=$(_git_local_main_or_master) || return
  git reset --soft "$mm"
}
