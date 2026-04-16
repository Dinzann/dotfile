# 🍺 Homebrew国内镜像加速配置
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# 🎯 最新brew API国内加速（关键配置）
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# 🤫 隐藏环境变量提示
export HOMEBREW_NO_ENV_HINTS="1"

# 环境变量配置
export EDITOR='nvim'

# 绑定快捷键
alias n='nvim'
alias fetch='fastfetch'
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias lt='eza --tree --icons'
alias ..='z ..'

# starship 配置
eval "$(starship init zsh)"

# zoxide 配置
eval "$(zoxide init zsh)"

# fzf 配置
source <(fzf --zsh)

# bat 配置
export BAT_THEME="Catppuccin Mocha"

# bob 配置
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# yazi 配置
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# python 配置
export PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"
alias python="/Library/Frameworks/Python.framework/Versions/3.14/bin/python3.14"

# zsh 插件
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
