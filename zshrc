autoload -Uz compinit
compinit

ZSHDIR=${HOME}/.zsh
source ${ZSHDIR}/alias

setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt auto_list
setopt auto_pushd
setopt always_last_prompt
setopt auto_menu
setopt check_jobs
setopt list_types
setopt multios
setopt noautoremoveslash
setopt no_beep
setopt nolistbeep
setopt print_eight_bit

export LS_COLORS='gxfxcxdxbxegedabagacad'
export LS_COLORS='di=01;36'
export EDITOR=vim
export TERM=xterm-256color
export CVS_RSH=ssh
export TMPDIR=/private/tmp
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export LESSCHARSET=utf-8

# Emacs like key binding
bindkey -e

bindkey "^P" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' command-path ${PATH}
zstyle ':completion:*' format '%F{blocks}%d%f'
#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors ${LS_COLORS}


function reload() {
source ${HOME}/.zshrc
}

export LANG=en_US.UTF-8

export PATH=~/bin:/opt/local/bin:/opt/local/sbin:${PATH}

autoload -U colors
colors

tmp_prompt="%{${fg[green]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[blue]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

if [ ${UID} -eq 0 ]; then
	tmp_prompt="%B%U${tmp_prompt}%u%b"
	tmp_prompt2="%B%U${tmp_prompt2}%u%b"
	tmp_rprompt="%B%U${tmp_rprompt}%u%b"
	tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt
PROMPT2=$tmp_prompt2
RPROMPT=$tmp_rprompt
SPROMPT=$tmp_sprompt

[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
	PROMPT="%{${fg[red]}%}[SSH @ ${HOST%%.*}]
${PROMPT}"
;

HISTFILE=${ZSHDIR}/history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
autoload history-search-end


