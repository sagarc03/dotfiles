rm -rf	~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -o  ~/.vim/colors/molokai.vim
cp vimrc ~/.vimrc
vim +PluginInstall +qall
cp tmux.conf ~/.tmux.conf
