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
		menu3 () {
			ba
			cd ~
			if [ -e .termux ];then
			cd ~/.termux
			R
			rm -f termux.properties > /dev/null 2>&1
			printf "\n\n Downloading button file\n\n"
			wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/termux.properties
			R
			printf "\nRestart termux and check\n"
			else
			cd ~/.termux
			R
			rm -f termux.properties > /dev/null 2>&1
			printf "\n\n Downloading button file\n\n"
			wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/termux.properties
			R
			printf "\nRestart termux and check\n"
			fi
			}
			menu3