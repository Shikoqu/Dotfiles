#!/usr/bin/env zsh

# ! Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # isn't cd faster to type tho?
# alias -- -="cd -" # go to previous directory

# ! Shortcuts
alias d="cd ~/Developer"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias h="history"
alias cl="clear"
alias j="jobs"

# make directories (even nested) and cd into last of them
function mcd() {
    mkdir -p "$@" && cd "$_"
}

# ! Enable aliases to be sudo’ed
alias sudo='sudo '

# ! Get week number
alias week='date +%V'

# ! IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# ! Recursively delete `.DS_Store` files
alias clean_DS_Store="find . -type f -name '*.DS_Store' -ls -delete"

# ! Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# ! Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# ! Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"
