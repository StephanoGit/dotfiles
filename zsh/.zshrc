# --- 1. Environment & Paths ---
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='nvim'

# SSH Agent Auto-Start
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi


autoload -Uz compinit
compinit

# --- 2. Plugin Manager (Zinit) ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting


# --- 3. Tool Initializations ---
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# Transient Prompt Logic
autoload -Uz add-zsh-hook
add-zsh-hook precmd transient-prompt-precmd

# Pre-calculate the transient version (The green arrow)
TRANSIENT_PROMPT="${PROMPT// prompt / prompt --profile transient }"

function transient-prompt-precmd {
    TRAPINT() { transient-prompt; return $(( 128 + $1 )) }
    SAVED_PROMPT="$(eval "printf '%s' \"${TRANSIENT_PROMPT}\"")"
}

autoload -Uz add-zle-hook-widget
add-zle-hook-widget zle-line-finish transient-prompt

function transient-prompt() {
    PROMPT="$SAVED_PROMPT" RPROMPT="" zle .reset-prompt
}



# --- 4. History & Completion ---
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_all_dups hist_save_no_dups hist_find_no_dups


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# --- 5. Keybindings ---
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s '^o' 'zi\n'

# --- 6. Aliases ---
alias c="clear"               
alias ls="eza --icons always -a"
alias la="eza --icons always -la"
alias ll="eza --icons always -ll"
alias lg="lazygit"
alias v="nvim"

# --- 7. Hooks ---
# Ghostty Terminal Bell Hook for failed commands
precmd() {
  local exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    print -n "\a"
  fi
}
