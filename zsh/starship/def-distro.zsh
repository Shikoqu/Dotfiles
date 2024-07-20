#!/usr/bin/env zsh

# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
    _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
    _distro="macos"

    # on mac os use the systemprofiler to determine the current model
    _device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')
    case $_device in
        *MacBook*) D="";;
        *mini*)    D="";;
        *)         D="";;
    esac
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                    I="";;
    *arch*)                    I="";;
    *debian*)                  I="";;
    *raspbian*)                I="";;
    *ubuntu*)                  I="";;
    *elementary*)              I="";;
    *fedora*)                  I="";;
    *coreos*)                  I="";;
    *gentoo*)                  I="";;
    *mageia*)                  I="";;
    *centos*)                  I="";;
    *opensuse* | *tumbleweed*) I="";;
    *sabayon*)                 I="";;
    *slackware*)               I="";;
    *linuxmint*)               I="";;
    *alpine*)                  I="";;
    *aosc*)                    I="";;
    *nixos*)                   I="";;
    *devuan*)                  I="";;
    *manjaro*)                 I="";;
    *rhel*)                    I="";;
    *macos*)                   I="";;
    *)                         I="";;
esac

export STARSHIP_DISTRO=$I
export STARSHIP_DEVICE=$D
