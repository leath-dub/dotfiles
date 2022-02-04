#!/bin/sh

# partitioning 
swappt="2GB"
partition() 
{
    if [ -d /sys/firmware/efi ]
    then
        BIOST="uefi"
    else
        BIOST="bios"
        dialog --backtitle "partition the disk" --title "Bios info:" --msgbox "Sorry this script does not support bios :(" 0 0
        break
    fi
    dialog --backtitle "Parition the disk" --title "Bios info:" --msgbox "Using $BIOST bios" 5 30
    disk=""
    while true; do
        disk=$(\
            dialog --backtitle "Partition the disk" \
                   --title "Choose a disk:" \
                   --inputbox "$(lsblk)" 0 0 \
            3>&1 1>&2 2>&3 3>&- \
        )
        if [ -e $disk -a "$disk" != "" -a "$disk" != "/dev/" -a "$disk" != "/dev" ]
        then
            confirm=$(dialog --backtitle "Partition the disk" --title "Confirm" --inputbox "Are you sure you want to install on $disk ? yes/No" 0 0 3>&1 1>&2 2>&3 3>&-)
            case $confirm in
                "yes")
                    rootpt=$(fdisk -l | grep $disk: | awk '{print $3 * 0.12}')
                    rootpt=$(printf %.0f $(echo "$rootpt" | bc -l))
                    dialog --msgbox "$rootpt" 0 0
                    warnpt=$(\
                        dialog --backtitle "Partition the disk" \
                               --title "Confirm" \
                               --inputbox "Warning, about to partition the $disk, all data will be lost, continue yes/No" 0 0 \
                        3>&1 1>&2 2>&3 3>&- \
                    )
                    ## danger actual partition section
                    # case $warnpt in
                    #     "yes")
                    #         (
                    #           echo g; 
                    #           echo n;
                    #           echo ;
                    #           echo ;
                    #           echo +1GB;
                    #           echo n;
                    #           echo ;
                    #           echo ;
                    #           echo "+"$rootpt"GB";
                    #           echo n;
                    #           echo ;
                    #           echo ;
                    #           echo +2GB;
                    #           echo n;
                    #           echo ;
                    #           echo ;
                    #           echo ;
                    #           echo t;
                    #           echo 1;
                    #           echo 1;
                    #           echo t;
                    #           echo 3;
                    #           echo 19;
                    #           echo w;
                    #         ) | fdisk $disk
                    #         mkfs.fat -F32 $disk*1
                    #         mkswap $disk*3
                    #         swapon $disk*3
                    #         mkfs.ext4 $disk*2
                    #         mkfs.ext4 $disk*4
                    #         mkdir /mnt/boot
                    #         mkdir /mnt/home
                    #         mount $disk*2 /mnt
                    #         mount $disk*4 /mnt/home
                    #         mount $disk*1 /mnt/boot
                    #         genfstab -U /mnt >> /mnt/etc/fstab
                    #         dialog --backtitle "Partition the disk" --title "Done" --msgbox "Finsished partitioning" 0 0
                    #         break
                    #         ;;
                    #     *)
                    #      break
                    #      ;;
                    # esac
                    break
                    ;;
                *)
                    echo ""
                    ;;
            esac
        else
            dialog --backtitle "ERROR" --title "Device not found!" --msgbox "Make sure input is of form /dev/[DEVICE]" 10 40
        fi
    done

}

getcred ()
{
    username=$(\
        dialog --form "Enter your username:" 0 0 0 \
                      "Username:" 0 0 \
                      "" 0 12 12 100 \
        3>&1 1>&2 2>&3 3>&- \
    )
    userpass=$(\
        dialog --insecure \
               --passwordbox "Enter password:" 0 0 \
        3>&1 1>&2 2>&3 3>&- \
    )
}

getshell ()
{
    usershell=$(\
        dialog --backtitle "Install" \
               --title "Choose a shell" \
               --inputbox "$(cat /etc/shells)" 0 0 \
        3>&1 1>&2 2>&3 3>&- \
    )
}

## Preinstall stuff

preinstall ()
{
    if nc -zw1 google.com 443
    then
        echo "Network Good!"
    else
        dialog --backtitle "Network" --title "No Network\!" --msgbox "Try using iwd or wpa_supplicant to connect to wifi" 7 30
        break
    fi
    timedatectl set-ntp true
}






## install pkgs
getpkgs ()
{
  pacstrap /mnt  grub wireless_tools dhclient neovim iwd networkmanager base base-devel linux linux-firmware networkmanager patch libxinerama libxft libtool libev xorg alsa-utils curl dhclient dialog exa feh ffmpeg linux-firmware gcc git htop iwd maim make neofetch neovim pandoc pcmanfm pulseaudio python-pip qutebrowser ranger openssh vlc w3m wget curl brightnessctl zathura zsh xorg-xinit noto-fonts zsh-syntax-highlighting rustup tlp neomutt
}

postinstall ()
{
    ln -sf /mnt/usr/share/zoneinfo/Eire /mnt/etc/localtime
    
}
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

#   printf "Pick user's shell: "
#   #chsh -l

#read usershell
# useradd -m -g wheel -s $usershell $username 
# (echo $userpass; echo $userpass) | passwd $username
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

# Change /etc/default/keyboard
#```
#XKBOPTIONS="caps:swapescape"
#```
getshell
partition
getcred
