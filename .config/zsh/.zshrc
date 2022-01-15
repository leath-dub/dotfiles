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
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
if [[ "$(tput cols)" -gt 61 ]]
then
    fm6000 -de dwm -f /home/$USER/ascii/pika_fm6000
fi
#fm6000 -de dwm -f /home/$USER/ascii/skull
#~/fetch

# Pywal tty 
sh -c $HOME/.cache/wal/colors-tty.sh

# Alias'
alias b='backup_sh'
alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias ls="exa --icons"
alias cdpy="cd /home/$USER/backup/backups-linux-sd/comsci1/sem_2/ca117/"

