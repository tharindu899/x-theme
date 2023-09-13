R () {
	cd $PREFIX/bin
	if [ -e python ];then
	python ~/zsh-theme/.random.py
	else
	pkg install python
	python ~/zsh-theme/.random.py
	fi
	}
	fl () {
		cd ~/zsh-theme
		}
	ba() {
		R
		figlet ZSH-THEME
		echo
		}
		start() {
			fl
			bash start-zsh.sh
			}
		men() {
			cd ~
			if [ -e .zshrc ];then
			printf "\n\n ☢ \033[1;92m You already installed zsh!!!\003[0m\n\n"
			exit
			else
			start
			fi
			}
			men