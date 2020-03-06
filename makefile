.PHONY: install uninstall help
.DEFAULT_GOAL := help

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

install-zsh: # Install zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

create-vimrc:
	find vim/*.vim -maxdepth 1 -type f -exec  echo source $(PWD)/{} \; >> ~/.vimrc
	vim +PluginInstall +qall

create-tmux-conf:
	find tmux/*.conf -maxdepth 1 -type f -exec  echo source $(PWD)/{} \; >> ~/.tmux.conf

create-zshrc:
	find zshrc/*.conf -maxdepth 1 -type f -exec  echo source $(PWD)/{} \; >> ~/.zshrc

uninstall: # Uninstall everything"
	echo "uninstalling y"

help:
	echo "Check makefile"
