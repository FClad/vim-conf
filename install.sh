#!/bin/bash

# Retrieve path to the install directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Symlink .vim directory
if [ "${DIR}" != "${HOME}/.vim" ]; then
	if [ -e "${HOME}/.vim" ]; then
		echo "Warning: a vim folder already exists. Old folder moved to vim_bak."
		mv ${HOME}/.vim ${HOME}/vim_bak
	fi
	echo "Creating symbolic link for .vim folder."
	ln -s ${DIR} ${HOME}/.vim
fi

# Symlink .vimrc file
if [ ! -L "${HOME}/.vimrc" ]; then
	if [ -e "${HOME}/.vimrc" ] ; then
		echo "Warning: a vimrc file already exists. Old file moved to vimrc.bak."
		mv ${HOME}/.vimrc ${HOME}/vimrc.bak 
	fi
	echo "Creating symbolic link for .vimrc file."
	ln -s ${DIR}/vimrc ${HOME}/.vimrc
fi


# Create temp directory
if [ ! -d "${HOME}/.vim/temp" ]; then
	echo "Creating temp folder."
	mkdir ${HOME}/.vim/temp
fi

# Create undo directory
if [ ! -d "${HOME}/.vim/undo" ]; then
	echo "Creating undo folder."
	mkdir ${HOME}/.vim/undo
fi

# Create bundle directory
if [ ! -d "${HOME}/.vim/bundle" ]; then
	echo "Creating bundle folder."
	mkdir ${HOME}/.vim/bundle
fi

# Create NeoVim config file
if [ ! -f "${HOME}/.config/nvim/init.vim" ]; then
	echo "Initializing NeoVim configuration."
	mkdir -p ${HOME}/.config/nvim/
	echo """
let g:loaded_python_provider=1
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
	""" > ${HOME}/.config/nvim/init.vim
fi

# Download Vundle plugin manager
if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
	echo "Downloading Vundle plugin manager."
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Check whether YouCompleteMe is already installed
if [ ! -d "${HOME}/.vim/bundle/YouCompleteMe" ]; then
	ycm_exists=false
else
	ycm_exists=true
fi

# Install any missing plugin
echo "Installing plugins."
vim +PluginInstall +qall

# Compile YCM
if [ ! ycm_exists ]; then
	echo "Compiling YCM."
	cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
fi

