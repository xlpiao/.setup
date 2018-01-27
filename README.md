# Personal Configuration for Mac and Ubuntu
---------------------------------

## Installation
```
git clone https://github.com/xlpiao/.xlpiao.git
cd .xlpiao
./install.sh
```

## Git Configuration 
```
git config --global user.email "Your Email Address"
git config --global user.name "Your Name"
```

## List of VIM Plugins
```
https://github.com/gmarik/Vundle.vim.git
https://github.com/jiangmiao/auto-pairs.git
https://github.com/terryma/vim-multiple-cursors.git
https://github.com/Chiel92/vim-autoformat.git
https://github.com/scrooloose/nerdtree.git
https://github.com/majutsushi/tagbar.git
https://github.com/will133/vim-dirdiff.git
https://github.com/salsifis/vim-transpose.git
https://github.com/junegunn/vim-easy-align.git
https://github.com/vim-airline/vim-airline.git
https://github.com/octol/vim-cpp-enhanced-highlight.git
https://github.com/beyondmarc/hlsl.vim.git
https://github.com/tikhomirov/vim-glsl.git
https://github.com/pangloss/vim-javascript.git
https://github.com/kbenzie/vim-spirv.git
https://github.com/alpertuna/vim-header.git
https://github.com/vim-scripts/DoxygenToolkit.vim.git
```
<!--
## ubuntu
```
sudo ln -sf ${PWD}/ubuntu/Envy\ Code\ R\ PR7 /usr/share/fonts/truetype
cp ubuntu/terminal.xml ~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
cp ubuntu/nautilus.xml ~/.gconf/apps/nautilus/preferences/%gconf.xml
cp ubuntu/metacity.xml ~/.gconf/apps/metacity/general/%gconf.xml
cp ubuntu/background.xml ~/.gconf/desktop/gnome/background/%gconf.xml

sudo apt-get update
sudo apt-get install -y vim tmux screen python-dev gnuplot r-base chromium-browser exuberant-ctags subversion g++ openssh-server language-pack-ko ibus-hangul indicator-multiload build-essential cmake git gimp nvidia-current texlive-full unity-tweak-tool
sudo apt-get install virtualbox virtualbox-guest-additions
sudo ldconfig
sudo /etc/init.d/vboxdrv setup

cd ~
mkdir svn
cd svn
svn co --depth=empty svn+ssh://hyanglan@snsd.skku.edu/SVN/svnroot papl
svn co svn+ssh://snsd.skku.edu/var/svn/svn-pjs pjs
svn up --depth=empty ~/svn/papl/projects

cd ~/papl-svn/projects/Parallel_js/webkit-webcl/external/intel-opencl-sdk
sudo dpkg -i *.deb
sudo ln -sf /opt/intel/opencl-1.2-3.1.1.11385/etc/intel64.icd  /etc/OpenCL/vendors/
sudo ldconfig

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
sudo ldconfig
``` -->
