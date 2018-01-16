#!/bin/bash
# File: install.sh
# Author: Xianglan Piao <xianglan0502@gmail.com>
# Date: 2013.03.21
# Last Modified Date: 2018.01.15
# Last Modified By: Xianglan Piao <xianglan0502@gmail.com>


PACKAGE=("vim" "openssh-server" "tmux" "screen" "exuberant-ctags")
for p in ${PACKAGE[@]}; do
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo apt-get -y install $p
    elif [[ "$OSTYPE" == "darwin16" ]]; then
        brew install $p
    else
        pkg install $p
    fi
done

TARGET=("vim" "vimrc" "bashrc" "bash_profile")
for t in ${TARGET[@]}; do
    rm -rf $HOME/.$t
    ln -s $PWD/$t $HOME/.$t
    echo $t" is changed"
done

mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
