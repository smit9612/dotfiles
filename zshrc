fpath=(/usr/local/share/zsh-completions $fpath)

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
# Essential
source ~/.zplug/init.zsh
# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"
# Prohibit updates to a plugin by using the "frozen:" tag
zplug "k4rthik/git-cal", as:command, frozen:1
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "paulmelnikow/zsh-startup-timer"
zplug "tysonwolker/iterm-tab-colors"
zplug "desyncr/auto-ls"
zplug "momo-lab/zsh-abbrev-alias"
zplug "djui/alias-tips", from:github
zplug "modules/git", from:prezto
zplug "plugins/git-extras",  from:oh-my-zsh, as:plugin
zplug "plugins/history",  from:oh-my-zsh, as:plugin
zplug "dracula/zsh", as:theme
# Install if jq is available
zplug "b4b4r07/emoji-cli", as:command, if:"(( $+commands[jq] ))"
# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

alias ws='cd ~/Documents/workspace/Projects'
alias rgb='cd ~/Documents/workspace/Projects/rgb-ios'


# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

###########################

# ~/.zshrc
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
