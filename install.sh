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
#pacstrap /mnt grub wireless_tools net_tools dhclient
#neovim iwd networkmanager base base-devel linux
#linux-firmware networkmanager 
## install pkgs
#sudo pacman --noconfirm --needed -S patch libxinerama libxft libtool libev xorg
# alsa-utils curl dhclient dialog exa feh ffmpeg
#linux-firmware gcc git htop iwd maim make neofetch neovim
#pandoc pcmanfm pulseaudio python-pip qutebrowser ranger openssh
#texlive vlc w3m wget curl brightnessctl zathura zsh xorg-xinit noto-fonts
#zsh-syntax-highlighting rustup tlp
#
# mkdir .local
# mkdir .local/share
## vim-plug
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#rustup default stable

## paru AUR helper 
#mkdir $HOME/.sources
#cd $HOME/.sources
#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si
#paru
#paru -S picom-git

## add user
read -p "Enter a user name: " $username
chsh -l
read -p "Pick user's shell: " $usershell
# useradd -m -g wheel -s $usershell $username 
# passwd $username
# nvim /etc/sudoers

## graphics card specifics
#nvidia nvidia-utils nvidia-settings
#xf86-video-amdgpu
#
## font
#wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/complete/JetBrains\ Mono\ NL\ Regular\ Nerd\ Font\ Complete.ttf
#mkdir /usr/share/fonts/TTF
#sudo mv JetBrainsMono
## Above font is named JetBrains\ Mono\ Nerd\ Font\ Complete.ttf
#
## vim-plug
#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
## Sources
# cd
#git clone https://github.com/leath-dub/dotfiles.git .dotfiles
# cd 
# ln -s ~/.dotfiles/.config ~
# ln -s ~/.dotfiles/.zshenv ~
# ln -s ~/.dotfiles/.xinitrc ~
# git clone https://github.com/leath-dub/dev.git .dev

## pywal & qutewal
# pip install pywal
# ~/.local/bin/wal --theme random_dark
# cd ~/.sources
# git clone https://gitlab.com/jjzmajic/qutewal.git
# cd qutewal
# pip install inotify-simple psutil python-prctl
# cd ~/.sources
#git clone https://github.com/leath-dub/dwm.git
#git clone https://github.com/leath-dub/st.git
#git clone https://github.com/leath-dub/dmenu.git
#git clone https://github.com/Jaredk3nt/homepage.git
#
#systemctl enable iwd
#systemctl enable NetworkManager
#systemctl enable tlp

## set up /etc/hostname
#read -p "What do you want to name the system(e.g. desktop): " hostname
## echo $hostname > /etc/hostname
#echo "127.0.0.1       localhost" >> /etc/hosts
#echo "::1             localhost" >> /etc/hosts
#echo "127.0.0.1       "$hostname".localdomain "$hostname >> /etc/hosts

## make grub fancy 
# cd .sources
# git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
# cd Top-5-Bootloader-Themes
# ./install.sh


#partition



