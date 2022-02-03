# Created by newuser for 5.8
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%b %u %c"

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
# func to print git info
_git_prompt() {
    if [[ $(echo ${vcs_info_msg_0_} | grep master | wc -l) -eq 1 ]]
    then
        echo " Master"
    else
        echo " No repo"
    fi
}

# Zsh prompt
(( COLUMNS < 40 )) && PROMPT="%{$fg[red]%}┌──%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}"$'\n'"%{$fg[red]%}└──╼ %B%F{51}"$'%{\e[36m%}$ %{\e[0m%}' 
(( COLUMNS > 40 )) && PROMPT="%{$fg[red]%}┌──%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}─"$'%{\e[36m%}[$(_git_prompt)]%{\e[0m%}'"%{$fg[red]%}─%{$fg[yellow]%}[%(5~|%-1~/…/%3~|%4~)]"$'\n'"%{$fg[red]%}└──╼ %B%F{51}"$'%{\e[36m%}$ %{\e[0m%}'
(( COLUMNS < 20 )) && PROMPT="%{$fg[red]%}❭ %B%F{51}"$'%{\e[0m%}'
# Catching SIGWINCH signal and updating prompt
TRAPWINCH() { 
    (( COLUMNS < 40 )) && PROMPT="%{$fg[red]%}┌──%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}"$'\n'"%{$fg[red]%}└──╼ %B%F{51}"$'%{\e[36m%}$ %{\e[0m%}' 
    (( COLUMNS > 39 )) && PROMPT="%{$fg[red]%}┌──%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}─"$'%{\e[36m%}[$(_git_prompt)]%{\e[0m%}'"%{$fg[red]%}─%{$fg[yellow]%}[%(5~|%-1~/…/%3~|%4~)]"$'\n'"%{$fg[red]%}└──╼ %B%F{51}"$'%{\e[36m%}$ %{\e[0m%}'
    (( COLUMNS < 20 )) && PROMPT="%{$fg[red]%}❭ %B%F{51}"$'%{\e[0m%}'
}
# bash equivlant
# export ps1="\e[0;31m┌──\e[1;32m[\u@\h]\e[0;31m─\e[0;36m[\d{%d %b} \a]\e[0;31m─\e[0;33m[\w]\n\e[0;31m└──╼ \e[1;36m\$\[$(tput sgr0)\] "

# syntax highlighting plugin
if [[ -a /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -a /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Good Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Neofetch
#neofetch --ascii_distro Pikachu
#if [[ "$(tput cols)" -gt 61 ]]
#then
#    fm6000 -de dwm -f /home/$USER/.dev/ascii/pika_fm6000
#fi
#fm6000 -de dwm -f /home/$USER/ascii/skull
#~/fetch

# Pywal tty 
# sh -c $HOME/.cache/wal/colors-tty.sh
if [ "$TERM" = "linux" ]
then
    echo -en "\e]P0222222" #black
    echo -en "\e]P8222222" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white
    clear #for background artifacting
fi

# Syntax highlighting in less(man pages e.g.)
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Alias'
alias b='backup_sh'
alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias ls="exa --icons"
alias cdpy="cd $HOME/comsci/1/2_sem/modules/ca117/"
alias cdco="cd $HOME/comsci/1/2_sem/modules/"
alias nml="neomutt -F /home/cathal/.config/mutt/muttrc.leath"
alias nm="neomutt -F /home/cathal/.config/mutt/muttrc"
