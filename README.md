dotfiles
========

After install of arch-linux/ any other linux

1. Install the stuff (requires root access)


	sudo pacman -S git gvim tmux zsh xclip terminator unzip wget curl svn bzr    

2. Set up git

~> Set up user name , email

	git config --global user.name "anooprh"
	git config --global user.email "anoop.hallur@gmail.com"
	
~> Generate ssh keys, upload to github

	ssh-keygen -t rsa -C "anoop.hallur@gmail.ocm"
	
	When asked for paraphrase, do not enter anything. Just leave it blank.
	
	ssh-add ~/.ssh/id_rsa

	xclip -sel clip < ~/.ssh/id_rsa.pub  
		copied to clipboard,  upload this in github, bitbucket, wherever

3. Change default shell to z-shell

	sudo chsh -s `which zsh`

4. Set up dotfiles(zshrc, vimrvc, vim, tmux.conf)


	cd ~/ && git clone --recursive https://github.com/anooprh/dotfiles && cd dotfiles &&  git submodule init && git submodule update && sh bootstrap.sh

