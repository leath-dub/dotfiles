#!/bin/sh

# partitioning 
partition() 
{
    if [ -d /sys/firmware/efi ]
    then
        BIOST="uefi"
    else
        BIOST="bios"
    fi
    frmt=0 # format true/false 1/0
    echo "Using "$BIOST" bios"
    lsblk
    while [ "$frmt" = 0 ]
    do
        read -p "Write the path of the disk to be partitioned(e.g /dev/sda): " disk
        ispath=$(echo $disk | sed 's/\/dev\/.*//g')
        if [ -z "$ispath" -a -n "$disk" ] # -a -n $(echo $disk | sed 's/\/*//g') -a -n "$disk" ]
        then
            frmt=1
            echo "Format correct"
        else
            echo "Format incorrect"
            read -p "Enter r: retry e: exit : " input
            if [ "$input" = "r" ]
            then
                echo ""
            elif [ "$input" = "e" ]
            then
                exit
            else
                echo ""
            fi
        fi
    done
}
## pacastrap in live iso core pkgs for network
#pacstrap /mnt grub wireless_tools net_tools dhcpd dhclient
#neovim iwd networkmanager base base-devel linux
#linux-firmware networkmanager 
## install pkgs
#sudo pacman --noconfirm --needed -S patch libxinerama libxft libtool libev xorg
#xorg-utils alsa-utils curl dhcpd dialog exa feh ffmpeg
#linux-firmware gcc git htop iwd maim make mp3 neofetch neovim
#pandoc pcmanfm pulseaudio python-pip qutebrowser ranger ssh
#texlive vlc w3m wget brightnessctl zathura zsh
#zsh-syntax-highlighting rustup scim
#
## paru AUR helper 
#mkdir $HOME/.sources
#cd $HOME/.sources
#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si
#paru install picom-git
#
## graphics card specifics
#nvidia nvidia-utils nvidia-settings
#xf86-video-amdgpu

## font
#wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/complete/JetBrains\ Mono\ Regular\ NL\ Nerd\ Font\ Complete.ttf
## Above font is named JetBrainsMono Nerd Font

## Sources
# git clone https://github.com/leath-dub/dwm.git
partition



