# My aliases because I'm lazy af and I don't like typing

alias up='sudo apt update && sudo apt upgrade -y && sudo snap refresh'

# PLEASE UPDATE TO YOUR DIRECTORIES
alias home='cd $HOME'
alias repos='cd $HOME/.repos/'
alias work='cd $HOME/.repos/work/'
alias personal='cd $HOME/.repos/personal/'
alias downloads='cd $HOME/Downloads/'
alias documents='cd $HOME/Documents/'
alias config='cd $HOME/.config/'
alias notes='cd $HOME/Documents/notes/'

# nvim stuff
alias cfgnvim='nvim $HOME/.config/nvim/'

# file explorer
alias o='open .'

# jumps
alias ..='cd ..'
alias ....='cd ../..'

# config stuff
alias srcbash='source ~/.bashrc'
alias bashcfg='nvim ~/.bashrc'

# neovim plugins folder
alias plugins='cd $HOME/.config/nvim/lua/'

# eza (pretty directory tree)
alias la='eza -a --tree -L 1 --icons'
