echo "Welcome to Linux, friend!"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# 添加zsh插件
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
zsh-history-substring-search
autojump
z
command-not-found
colored-man-pages
asdf
 )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lecsven/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lecsven/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lecsven/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lecsven/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


####################################################
# new add my own configs
####################################################
# -----------------------------------------------------------------------
# 配置wsl代理
# -----------------------------------------------------------------------
win_ip=$(ip addr show wifi0 |grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "the windows ip is: "$win_ip
export https_proxy="http://${win_ip}:7890"
export http_proxy="http://${win_ip}:7890"
export all_proxy="socks5://${win_ip}:7890"
# -------------已失效-----------------------------------------------------
# 在终端使用clash代理
# where proxy
# proxyon () {
#   export http_proxy="http://127.0.0.1:7890"
#   export https_proxy="http://127.0.0.1:7890"
#   export all_proxy=socks5://127.0.0.1:7890
#   echo "HTTP Proxy on"
# }
# proxyon () {
#   export http_proxy="http://172.27.48.1:7890"
#   export https_proxy="http://172.27.48.1:7890"
#   export all_proxy=socks5://172.27.48.1:7890
#   echo "HTTP Proxy on"
# }
# # where noproxy
# noproxy () {
#   unset http_proxy
#   unset https_proxy
#   unset all_proxy
#   echo "HTTP Proxy off"
# }
# from: https://szthanatos.github.io/topic/wsl2/coding_with_wsl2_04/
# proxyon() {
#   local host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
#   export ALL_PROXY="http://${host_ip}:7890"
#   export all_proxy="http://${host_ip}:7890"
#   echo -e "Acquire::http::Proxy \"http://${host_ip}:7890\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
#   echo -e "Acquire::https::Proxy \"http://${host_ip}:7890\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
#   curl ip.sb
# }

# proxyoff() {
#   unset ALL_PROXY
#   unset all_proxy
#   sudo sed -i -e '/Acquire::http::Proxy/d' /etc/apt/apt.conf
#   sudo sed -i -e '/Acquire::https::Proxy/d' /etc/apt/apt.conf
#   curl ip.sb
# }
# alias proxy="proxyon"
# -----------------------------------------------------------------------

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

export EDITOR=vim
# export EDITOR=nvim

## Use Neovim as "preferred editor"
#export VISUAL=nvim
## set -o vi
 


## 解决oh-my-zsh 中文乱码
## export LC_ALL=en_US.UTF-8  
## export LANG=en_US.UTF-8

#soundon(){
#export HOST_IP="$(ip route |awk '/^default/{print $3}')"
#export PULSE_SERVER="tcp:$HOST_IP"
##export DISPLAY="$HOST_IP:0.0"
#echo "The host_ip is $HOST_IP,pusle_server is $PULSE_SERVER"
# }



# export HOST_IP="$(ip route |awk '/^default/{print $3}')"
# export PULSE_SERVER="tcp:$HOST_IP"
# export LIBGL_ALWAYS_INDIRECT=1
# export NO_AT_BRIDGE=1
# export DISPLAY="$(ip route|awk '/^default/{print $3}'):0.0"
# export PULSE_SERVER="${PULSE_SERVER:-tcp:$(ip route|awk '/^default/{print $3}')}"


#########################################################################
alias settings
#########################################################################
# ---------------Must Setted Alias Configs-------------------------------
# some more ls aliases
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ll="ls -ltra"
# my own add
alias l.='ls -d .* --color=auto'

## alias zsr="exec bash" # 重新启动 bash
## alias zsr="exec zsh" # 重新启动 zsh
## alias zs="subl ~/.zshrc" # 用 sublimetext 打开 ~/.zshrc 文件

# alias zsr="source ~/.zshrc"
alias zsr="exec zsh" # 重新启动 zsh
## alias zs="subl ~/.zshrc" # 用 sublimetext 打开 ~/.zshrc 文件
# alias zs="vim ~/.zshrc"
alias vs="vim ~/.zshrc" # 用 vim 打开 ~/.zshrc 文件

alias tmuxs="vim ~/.tmux.conf" #用vim 打开tmux 配置

# --------------Other Useful Alias Configs ------------------------------

#alias vi=/usr/bin/nvim
# alias vim=/usr/bin/nvim
# alias vim=nvim
alias nvim=vim
#alias nvim=/usr/bin/nvim 
# alias vims="nvim /home/lecsven/Documents/linux_current_vimrc.vim"
# alias vims="nvim /mnt/h/Dropbox/__useful_configs/Vim_configs/linux_current_vimrc_init.vim"
# /media/psf/Dropbox/__useful_configs/Vim_configs
## alias vims="vim /Users/lecsven/Dropbox/__useful_configs/Vim_configs/mac_current_vimrc.vim"
alias vims="vim $HOME/.vimrc"
# --------------Sometimes Used Alias Configs-----------------------------
alias ra="ranger"

# ------------------Other Alias Settings---------------------------------

## export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

## alias ctags="/usr/local/bin/ctags"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

##配置 GCC
#alias gcc='gcc-8'
#alias cc='gcc-8'
#alias g++='g++-8'
#alias c++='c++-8'

## # for jupyter
## alias jpu="launchctl unload ~/Library/LaunchAgents/com.jupyter.lab.plist"
## alias jpl="launchctl load ~/Library/LaunchAgents/com.jupyter.lab.plist"
## alias jpr="jpu && jpl"

## for git 
#alias gs='git status '
#alias ga='git add '
#alias gb='git branch '
#alias gc='git commit'
#alias gd='git diff'
#alias gco='git checkout '
#alias gk='gitk --all&'
#alias gx='gitx --all'
#alias gdm='git diff --diff-filter=M'
#alias got='git '
#alias get='git '

## alias node=/usr/local/bin/node
## enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'

#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
##其他配置
## zsh cd 命令补全
## autoload -Uz compinit && compinit
## zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'


## export PATH=/Users/lecsven/opt/anaconda3/lib/python3.8/site-packages/powerline/bindings/vim:$PATH
#export macpath=/media/psf
alias man='man -M /usr/share/man'  #使用man查看英文man手册
alias cman='man -M /usr/share/man/zh_CN' #使用cman查看中文man手册

export FONTCONFIG_PATH=/mnt/c/Windows/Fonts
export PATH="/home/lecsven/.local/bin/:$PATH"
# export PATH="$PATH:~/.local/bin/"
# eval $(thefuck --alias)

source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/exa.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh
# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh
source ~/.config/zsh/fzf/key-bindings.zsh
source ~/.config/zsh/fzf/completion.zsh
unsetopt beep


# source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash
# source "/home/lecsven/.asdf/installs/rust/stable/env"
# export PATH="$PATH:/home/lecsven/.asdf/installs/rust/stable/bin"
export PATH="$HOME/.cargo/bin:$PATH"
# export FZF_DEFAULT_OPTS='--preview "echo {}"   --preview-window=down,3,wrap'
export PATH="$PATH:/home/lecsven/my_script/"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias config='/usr/bin/git --git-dir=/home/lecsven/.cfg/ --work-tree=/home/lecsven'
