#!/bin/bash
# File: install.sh
# Author: Xianglan Piao <xianglan0502@gmail.com>
# Date: 2017.07.23
# Last Modified Date: 2017.08.07
# Last Modified By: Xianglan Piao <xianglan0502@gmail.com>

cd ~/Dropbox/.hyanglan
# sudo apt-get install nautilus-dropbox
ln -sf ${PWD}/bashrc ~/.bashrc #for ubuntu
ln -sf ${PWD}/bashrc ~/.bash_profile #for mac
ln -sf ${PWD}/vimrc ~/.vimrc
cp -r ${PWD}/vim ~/.vim
ln -sf ${PWD}/ssh ~/.ssh #for mac

# ubuntu
sudo ln -sf ${PWD}/ubuntu/Envy\ Code\ R\ PR7 /usr/share/fonts/truetype
cp ubuntu/terminal.xml ~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
cp ubuntu/nautilus.xml ~/.gconf/apps/nautilus/preferences/%gconf.xml
cp ubuntu/metacity.xml ~/.gconf/apps/metacity/general/%gconf.xml
cp ubuntu/background.xml ~/.gconf/desktop/gnome/background/%gconf.xml

# bundle for vim
cd ~/Dropbox/.hyanglan/
mkdir bundle
cd ~/.vim/bundle && git clone https://github.com/gmarik/Vundle.vim.git
# git clone https://github.com/Valloric/YouCompleteMe.git
# git clone https://github.com/Yggdroot/indentLine.git
# git clone https://github.com/majutsushi/tagbar.git
# git clone https://github.com/salsifis/vim-transpose.git
# git clone https://github.com/Raimondi/delimitMate.git
# git clone https://github.com/scrooloose/nerdtree.git
# git clone https://github.com/pangloss/vim-javascript.git

sudo apt-get update
sudo apt-get install -y vim tmux screen python-dev gnuplot r-base chromium-browser exuberant-ctags subversion g++ openssh-server language-pack-ko ibus-hangul indicator-multiload build-essential cmake git gimp nvidia-current texlive-full unity-tweak-tool

sudo apt-get update
# sudo apt-get install virtualbox virtualbox-guest-additions

# sudo ldconfig
# sudo /etc/init.d/vboxdrv setup


cd /usr/include
ctags -R

# mkdir workspace
# cd ~

# svn co --depth=empty svn+ssh://hyanglan@115.145.211.185/SVN/svnroot ~/papl-svn
svn up --depth=empty ~/svn/papl/projects
svn up --depth=empty ~/svn/papl/users
svn up --depth=empty ~/svn/papl/papers

# svn up ~/papl-svn/projects/Parallel_js/webkit-webcl/branch
# svn up ~/papl-svn/projects/Parallel_js/webkit-webcl/external
# svn up ~/papl-svn/projects/Parallel_js/webkit-webcl/master
# svn up ~/papl-svn/projects/Parallel_js/webkit-webcl/doc

cd ~
mkdir svn
cd svn
svn co --depth=empty svn+ssh://hyanglan@snsd.skku.edu/SVN/svnroot papl
svn co svn+ssh://snsd.skku.edu/var/svn/svn-pjs pjs

cd ~/papl-svn/projects/Parallel_js/webkit-webcl/external/intel-opencl-sdk
sudo dpkg -i *.deb
sudo ln -sf /opt/intel/opencl-1.2-3.1.1.11385/etc/intel64.icd  /etc/OpenCL/vendors/
sudo ldconfig

# sudo add-apt-repository ppa:webupd8team/sublime-text-3
# sudo apt-get update
# sudo apt-get install sublime-text-installer
# sudo ldconfig
