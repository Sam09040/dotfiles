[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit; }
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

setopt autocd
setopt append_history inc_append_history share_history
setopt auto_param_slash
setopt globdots

PYTHON_VENV_NAME=".venv"
plugins=(git uv python fzf-tab zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete command-not-found tmux)

export ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function compile {
  file="$1"
  filename="${file%.*}"
  gcc "$file" -Wall -o "$filename" && ./"$filename"
}

alias ls="lsd -A"
alias cat="bat"
alias upgrade="sudo dnf5 upgrade -y"
alias ryujinx="~/scripts/ryujinx.sh"
alias dnf="dnf5"
alias fzf="fzf --preview='cat {}'"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# history
setopt share_history
setopt append_history
setopt hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# completion style 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color $realpath'

# shell integrations

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
export PIP_HOME="~/.local/bin"
export PATH=$PATH:$PIP_HOME
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

. "$HOME/.local/bin/env"
