# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"





# ssh shit
eval "$(ssh-agent -s)"





## DELETE THE RANDOM NVIM FILES WE DON'T GIVE A SHIT ABOUT
# The directory to be cleared
TARGET_DIR="$HOME/.local/state/nvim/sessions"

# Safety check
if [ -z "$TARGET_DIR" ]; then
	echo "Target directory is not set."
	exit 1
fi

# Delete all files and directories in the target directory
rm -rf "$TARGET_DIR"/*

# The directory to be cleared
TARGET_DIR="$HOME/.local/state/nvim/swap"

# Safety check
if [ -z "$TARGET_DIR" ]; then
	echo "Target directory is not set."
	exit 1
fi

# Delete all files and directories in the target directory
rm -rf "$TARGET_DIR"/*

# The directory to be cleared
TARGET_DIR="$HOME/.local/state/nvim/undo"

# Safety check
if [ -z "$TARGET_DIR" ]; then
	echo "Target directory is not set."
	exit 1
fi

# Delete all files and directories in the target directory
rm -rf "$TARGET_DIR"/*

export STM32CubeMX_PATH=/home/dev/STM32CubeMX