.PHONY: install uninstall help
.DEFAULT_GOAL := help

link: # symlink all files 
	rm ~/.bashrc ~/.zshrc ~/.vimrc ~/.tmux.conf
	ln -s $(PWD)/.zshrc ~/.zshrc 
	ln -s $(PWD)/.vimrc ~/.vimrc
	ln -s $(PWD)/.tmux.conf ~/.tmux.conf
	ln -s $(PWD)/.bashrc ~/.bashrc

install-all: # Install all softwares
	$(MAKE) install-zsh
	$(MAKE) install-vim
	$(MAKE) install-tmux

create-rc-all: # Create all rc files
	$(MAKE) create-zshrc
	$(MAKE) create-vimrc
	$(MAKE) create-tmux-conf

install-vim:
	if [ "$(uname)" == "Darwin" ]; then
		brew install vim && brew install macvim
		brew link macvim
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		apt install vim
	fi
	
install-tmux: # Install Tmux
	if [ "$(uname)" == "Darwin" ]; then
		brew install tmux
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		apt install tmux
	fi

install-zsh: # Install oh my zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

vim-setup:
	vim +PluginInstall +qall

help:
	echo "Check makefile"
