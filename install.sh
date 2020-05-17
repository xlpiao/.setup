#!/bin/bash
# File              : install.sh
# Author            : Xianglan Piao <xianglan0502@gmail.com>
# Date              : 2013.03.21
# Last Modified Date: 2020.04.29
# Last Modified By  : Xianglan Piao <xianglan0502@gmail.com>


PACKAGE=("git" "vim" "tmux" "ctags" "cmake" "clang-format")
for p in ${PACKAGE[@]}; do
  if [ "$(uname)" = "Linux" ]; then
    sudo apt -y install $p
  elif [ "$(uname)" = "Darwin" ]; then
    brew install $p
  else
    pkg install $p
  fi
done


clang-format -style=google -dump-config > clang-format-google
# sed -i -e 's/AccessModifierOffset: -1/AccessModifierOffset: -2/' clang-format-google
cp clang-format-google ~/.clang-format


TARGET=("vim" "vimrc" "bashrc" "bash_profile" "gitconfig")
for t in ${TARGET[@]}; do
  rm -rf $HOME/.$t
  ln -s $PWD/$t $HOME/.$t
  echo $t" is changed"
done
source $HOME/.bash_profile


if [[ -d "$HOME/.vim/bundle" ]]; then
  rm -rf $HOME/.vim/bundle
  mkdir -p $HOME/.vim/bundle
fi


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
