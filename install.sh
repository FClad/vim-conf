#!/bin/bash

# Retrieve path to the install directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Check if NeoVim is installed
which nvim &> /dev/null
if [ $? -eq 0 ]; then
	neovim_exists=1
else
	neovim_exists=0
fi

# Symlink .vim directory
if [ "${DIR}" != "${HOME}/.vim" ] && [ ! -L "${HOME}/.vim" ]; then
	if [ -e "${HOME}/.vim" ]; then
		echo "Warning: a vim folder already exists in ${HOME}."
		echo "Renaming existing folder as ${HOME}/vim_bak."
		mv ${HOME}/.vim ${HOME}/vim_bak
	fi
	echo "Creating symbolic link for .vim folder."
	ln -s ${DIR} ${HOME}/.vim
fi

# Symlink .vimrc file
if [ ! -L "${HOME}/.vimrc" ]; then
	if [ -e "${HOME}/.vimrc" ] ; then
		echo "Warning: a vimrc file already exists in ${HOME}."
		echo "Renaming existing file as ${HOME}/vimrc.bak."
		mv ${HOME}/.vimrc ${HOME}/vimrc.bak
	fi
	echo "Creating symbolic link for .vimrc file."
	ln -s ${DIR}/vimrc ${HOME}/.vimrc
fi

# Symlink NeoVim's init.vim file
if [ $neovim_exists -eq 1 ] && [ ! -L "${HOME}/.config/nvim/init.vim" ]; then
	if [ -e "${HOME}/.config/nvim/init.vim" ] ; then
		echo "Warning: an init.vim file already exists in ${HOME}/.config/nvim."
		echo "Renaming existing file as ${HOME}/.config/nvim/init.bak."
		mv ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.bak
	fi
	echo "Creating symbolic link for init.vim file."
	mkdir -p ${HOME}/.config/nvim/
	ln -s ${DIR}/init.vim ${HOME}/.config/nvim/init.vim
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

# Download Vundle plugin manager
if [ ! -d "${DIR}/bundle/Vundle.vim" ]; then
	echo "Downloading Vundle plugin manager."
	git clone https://github.com/VundleVim/Vundle.vim.git ${DIR}/bundle/Vundle.vim
fi

# Clean, update and install plugins
echo "Cleaning, updating and installing plugins."
vim +PluginClean +PluginUpdate +PluginInstall +qall

# Compile YCM
if [ -d "${DIR}/bundle/YouCompleteMe" ]; then
	echo "Compiling YCM."
	cd ${DIR}/bundle/YouCompleteMe && ./install.py --clang-completer
fi

