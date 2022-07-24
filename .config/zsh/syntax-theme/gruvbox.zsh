# Below is taken from:
#     https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/docs/highlighters

# Brackets{{{
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=001'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=008'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=004'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=009'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=011'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=013'
# }}}

# Cursor{{{
# ZSH_HIGHLIGHT_STYLES[cursor]='fg='
# }}}

# Line{{{
# ZSH_HIGHLIGHT_STYLES[line]='bold'
# }}}

# Main{{{
# unknown tokens / errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=001'

# shell reserved words (if, for)
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=004'

# aliases
ZSH_HIGHLIGHT_STYLES[alias]='fg=012'

# suffix aliases (requires zsh 5.1.1 or newer)
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=012'

# global aliases
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=012'

# shell builtin commands (shift, pwd, zstyle)
ZSH_HIGHLIGHT_STYLES[builtin]='fg=004'

# function names
ZSH_HIGHLIGHT_STYLES[function]='fg=003'

# command names
ZSH_HIGHLIGHT_STYLES[command]='fg=004'

# precommand modifiers (e.g., noglob, builtin)
ZSH_HIGHLIGHT_STYLES[precommand]='fg=013'

# command separation tokens (;, &&)
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=007'

# hashed commands
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=006'

# a directory name in command position when the AUTO_CD option is set
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=015'

# existing filenames
ZSH_HIGHLIGHT_STYLES[path]='fg=006'

# path separators in filenames (/); if unset, path is used (default)
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=014'

# prefixes of existing filenames
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=006'

# path separators in prefixes of existing filenames (/); if unset, path_prefix is used (default)
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=014'

# globbing expressions (*.txt)
ZSH_HIGHLIGHT_STYLES[globbing]='fg=009'

# history expansion expressions (!foo and ^foo^bar)
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=004'

# command substitutions ($(echo foo))
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=012'

# an unquoted command substitution ($(echo foo))
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=012'

# a quoted command substitution ("$(echo foo)")
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=012'

# command substitution delimiters ($( and ))
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=005'

# an unquoted command substitution delimiters ($( and ))
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=005'

# a quoted command substitution delimiters ("$( and )")
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=005'

# process substitutions (<(echo foo))
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=012'

# process substitution delimiters (<( and ))
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=003'

# arithmetic expansion $(( 42 )))
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=005'

# single-hyphen options (-o)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=013'

# double-hyphen options (--option)
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=013'

# backtick command substitution (`foo`)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=012'

# unclosed backtick command substitution (`foo)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=001'

# backtick command substitution delimiters (`)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=005'

# single-quoted arguments ('foo')
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=002'

# unclosed single-quoted arguments ('foo)
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=001'

# double-quoted arguments ("foo")
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=002'

# unclosed double-quoted arguments ("foo)
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=001'

# dollar-quoted arguments ($'foo')
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=003'

# unclosed dollar-quoted arguments ($'foo)
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=001'

# two single quotes inside single quotes when the RC_QUOTES option is set ('foo''bar')
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=006'

# parameter expansion inside double quotes ($foo inside "")
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=013'

# backslash escape sequences inside double-quoted arguments (\" in "foo\"bar")
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=003'

# backslash escape sequences inside dollar-quoted arguments (\x in $'\x48')
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=006'

# parameter assignments (x=foo and x=( ))
ZSH_HIGHLIGHT_STYLES[assign]='fg=011'

# redirection operators (<, >, etc)
ZSH_HIGHLIGHT_STYLES[redirection]='fg=009'

# comments, when setopt INTERACTIVE_COMMENTS is in effect (echo # foo)
ZSH_HIGHLIGHT_STYLES[comment]='fg=243'

# elided parameters in command position ($x ls when $x is unset or empty)
ZSH_HIGHLIGHT_STYLES[comment]='fg=001'

# named file descriptor (the fd in echo foo {fd}>&2)
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=003'

# numeric file descriptor (the 2 in echo foo {fd}>&2)
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=003'

# a command word other than one of those enumerated above (other than a command, precommand, alias, function, or shell builtin command).
ZSH_HIGHLIGHT_STYLES[arg0]='fg=004'

# everything else
ZSH_HIGHLIGHT_STYLES[default]='fg=015'
# }}}

# Patterns{{{
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' fg=white,bold,bg=red)
ZSH_HIGHLIGHT_PATTERNS+=('sudo' fg=006)
ZSH_HIGHLIGHT_REGEXP+=('\bsudo\b' fg=006)
# }}}
