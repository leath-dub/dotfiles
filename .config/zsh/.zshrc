# Created by newuser for 5.8
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

# precmd() { vcs_info }
precmd() {
    # stderr is produced "fatal: this operation must be run in a work tree"
    # this happens when "vcs_info" is run in .git dir. This can be ignored
    # safely
    vcs_info 2> /dev/null
    build_prompt
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%b %u %c"

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
# func to print git info
function _git_prompt() {
    if [[ $(echo ${vcs_info_msg_0_}) ]]
    then
        echo " "$(printf $vcs_info_msg_0_ | tr -d ' ')
    else
        echo " No repo"
    fi
}

for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

function build_prompt() {
    # gets length of left side once printed to stdout
    local PWDSIZE=${#${(%):-%(4~|%-1~/…/%3~|%~)}}
    local BOX3='┌─[%n@%m]─[$(_git_prompt)]─[]'
    local BOX2='┌─[%n@%m]─[$(_git_prompt)]'
    local BOX1='┌─[%n@%m]'

    TIME='%t'
    TIME=$(print -P '%t' | tr -d " ")
    TIME_LEN=$((${#${(S%%)TIME//$~ZER0/}} + 4))

    ZERO='%([BSUbfksu]|([FK]|){*})'
    BOX3_LEN=$((${#${(S%%)BOX3//$~ZER0/}} + PWDSIZE + TIME_LEN))
    BOX2_LEN=$((${#${(S%%)BOX2//$~ZER0/}} + TIME_LEN))
    BOX1_LEN=$((${#${(S%%)BOX1//$~ZER0/}} + TIME_LEN))

    local BOX1=$'${BOLD_GREEN}[%n@%m]'
    local BOX2=$'${CYAN}[$(_git_prompt)]'
    local BOX3=$'${YELLOW}[%(4~|%-1~/…/%3~|%~)]'
    local DIV=$'─'
    if [[ $BOX3_LEN -lt $COLUMNS ]]; then
        LEN=$BOX3_LEN
        # LEN+=$TIME_LEN
        # LEN+=2
        local TOP=$'${RED}╭─'$BOX1$'${RED}'$DIV''$BOX2$'${RED}'$DIV''$BOX3
        local BOTTOM=$'${RED}╰─╼ ${BOLD_CYAN}λ ${WHITE}'
        if ((TIME_LEN - 4 == 5));then pad=' ';fi
        RPROMPT='<%(?.${GREEN}.${RED})%?${WHITE}>'
        PROMPT=$TOP'${WHITE}${(r:((COLUMNS - LEN))::═:)}'$'${MAGENTA}$pad%t ${WHITE}═\n'$BOTTOM
    elif [[ $BOX2_LEN -lt $COLUMNS ]]; then
        LEN=$BOX2_LEN
        # LEN+=$TIME_LEN
        # LEN+=2
        local TOP=$'${RED}╭─'$BOX1$'${RED}'$DIV''$BOX2
        local BOTTOM=$'${RED}╰─╼ ${BOLD_CYAN}λ ${WHITE}'
        if ((TIME_LEN - 4 == 5));then pad=' ';fi
        RPROMPT='<%(?.${GREEN}.${RED})%?${WHITE}>'
        PROMPT=$TOP'${WHITE}${(r:((COLUMNS - LEN))::═:)}'$'${MAGENTA}$pad%t ${WHITE}═\n'$BOTTOM
    elif [[ $BOX1_LEN -lt $COLUMNS ]]; then
        LEN=$BOX1_LEN
        # LEN+=$TIME_LEN
        # LEN+=2
        local TOP=$'${RED}╭─'$BOX1
        local BOTTOM=$'${RED}╰─╼ ${BOLD_CYAN}λ ${WHITE}'
        if ((TIME_LEN - 4 == 5));then pad=' ';fi
        RPROMPT='<%(?.${GREEN}.${RED})%?${WHITE}>'
        PROMPT=$TOP'${WHITE}${(r:((COLUMNS - LEN))::═:)}'$'${MAGENTA}$pad%t ${WHITE}═\n'$BOTTOM
    else
        LEN=2
        TOP='${CYAN}λ '
        PROMPT=$TOP
        RPROMPT=''
    fi
}

alt_build_prompt()
{
  # normal
  #
  # ⌠ (cathal@laptop) git:(master) (~) ├───────────────────────────────→ (2:16)
  # ⌡ λ                                                                     (0)
  #
  # mini
  # ∫

  zero='%([BSUbfksu]|([FK]|){*})'

  local pwdsize=${#${(%):-%(4~|%-1~/…/%3~|%~)}}
  local threeb='  (%n@%m) git:($(_git_prompt)) ()'
  local twob='  (%n@%m) git:($(_git_prompt))'
  local oneb='  (%n@%m)'

  local t='%t'
  # local t=$(print -P '%t' | tr -d " ")
  local tlen=$((${#${(S%%)t//$~zero/}} + 3))

  threeb_len=$((${#${(S%%)threeb//$~zero/}} + pwdsize + tlen))
  twob_len=$((${#${(S%%)twob//$~zero/}} + tlen))
  oneb_len=$((${#${(S%%)oneb//$~zero/}} + tlen))

  local oneb=$'%{\e[32m%}(%{\e[92m%}%n@%m%{\e[32m%})'
  local twob=$'%{\e[35m%}git:(%{\e[95m%}$(_git_prompt)%{\e[35m%})'
  local threeb=$'%{\e[33m%}(%{\e[93m%}%(4~|%-1~/…/%3~|%~)%{\e[33m%})'

  if [[ $threeb_len -lt $COLUMNS ]]
    then
      len=$threeb_len
      local top=$'%{\e[34m%}╭ '$oneb' '$twob' '$threeb
      local bottom=$'%{\e[34m%}╰> '

      RPROMPT=$'${WHITE}(%(?.%{\e[92m%}.%{\e[91m%})%?${WHITE})'
      PROMPT=$top'${WHITE}${(r:((COLUMNS - len)):: :)}'$'${CYAN}%t${WHITE} |\n'$bottom
    fi
}
TRAPWINCH() {
  build_prompt
}
# # Zsh prompt
# (( COLUMNS < 40 )) && PROMPT="%{$fg[red]%}┌─%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}""${(l:COLUMNS:: :)$(exit_code)}"$'\n'"%{$fg[red]%}└─╼ %B%F{51}"$'%{\e[36m%}λ %{\e[0m%}'
# (( COLUMNS > 40 )) && PROMPT="%{$fg[red]%}┌─%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}─"$'%{\e[36m%}[$(_git_prompt)]%{\e[0m%}'"%{$fg[red]%}─%{$fg[yellow]%}[%(5~|%-1~/…/%3~|%4~)]""${(l:COLUMNS:: :)$(exit_code)}"$'\n'"%{$fg[red]%}└─╼ %B%F{51}"$'%{\e[36m%}λ %{\e[0m%}'
# (( COLUMNS < 20 )) && PROMPT="%{$fg[red]%}λ %B%F{51}"$'%{\e[0m%}'"${(l:COLUMNS:: :)$(exit_code)}"
# # Catching SIGWINCH signal and updating prompt
# TRAPWINCH() {
#     (( COLUMNS < 40 )) && PROMPT="%{$fg[red]%}┌─%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}""${(l:COLUMNS:: :)$(exit_code)}"$'\n'"%{$fg[red]%}└─╼ %B%F{51}"$'%{\e[36m%}λ %{\e[0m%}'
#     (( COLUMNS > 39 )) && PROMPT="%{$fg[red]%}┌─%B%F{51}%{$fg[green]%}[%n@%m]%f%b%{$fg[red]%}─"$'%{\e[36m%}[$(_git_prompt)]%{\e[0m%}'"%{$fg[red]%}─%{$fg[yellow]%}[%(5~|%-1~/…/%3~|%4~)]""${(l:COLUMNS:: :)$(exit_code)}"$'\n'"%{$fg[red]%}└─╼ %B%F{51}"$'%{\e[36m%}λ %{\e[0m%}'
#     (( COLUMNS < 20 )) && PROMPT="%{$fg[red]%}λ %B%F{51}"$'%{\e[0m%}'"${(l:COLUMNS:: :)$(exit_code)}"
# }
# bash equivlant
# export ps1="\e[0;31m┌──\e[1;32m[\u@\h]\e[0;31m─\e[0;36m[\d{%d %b} \a]\e[0;31m─\e[0;33m[\w]\n\e[0;31m└──╼ \e[1;36m\$\[$(tput sgr0)\] "

# Plugins
if [[ -a /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -a /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -a /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]
then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

setopt RE_MATCH_PCRE
setopt INTERACTIVE_COMMENTS

# Show hue values cmd - "for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done"
typeset -A ZSH_HIGHLIGHT_STYLES
typeset -A ZSH_HIGHLIGHT_PATTERNS
typeset -A ZSH_HIGHLIGHT_REGEXP
# fish shell like colours
source $ZDOTDIR/syntax-theme/gruvbox.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"

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

# fzf

fzf -h > /dev/null && export FZF_DEFAULT_COMMAND='find .'

# Syntax highlighting in less(man pages e.g.)
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Terminal emulator - st
export TERM="st-256color"

# Alias'
alias b='backup_sh'
alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias ls="exa --icons"
alias cdpy="cd $HOME/comsci/1/2_sem/modules/ca117/"
alias cdco="cd $HOME/comsci/1/2_sem/modules/"
alias nml="neomutt -F /home/cathal/.config/mutt/muttrc.leath"
alias nm="neomutt -F /home/cathal/.config/mutt/muttrc"
alias gr='cd ./$(git rev-parse --show-cdup 2> /dev/null)'
alias ll="exa -lah --icons"
