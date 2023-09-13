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
		e() {
			cd $PREFIX/bin
			echo "#!/data/data/com.termux/files/usr/bin/sh" >> e
			echo "killall -9 com.termux" >> e
			chmod 777 e
			}
		menu3 () {
			ba
			cd ~
			if [ -e .termux ];then
			R
			cd ~/.termux
			pwd
			rm -f termux.properties > /dev/null 2>&1
			printf "\n\n\033[1;92m Downloading button file \033[0m\n\n"
			wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/termux.properties
			e
			R
			printf "\n\033[1;92m Restart termux and check \033[0m\n\n"
			else
			R
			mkdir ~/.termux
			cd ~/.termux
			rm -f ~/.termux/termux.properties > /dev/null 2>&1
			printf "\n\033[1;92m Downloading button \033[0m\n\n"
			wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/termux.properties
			e
			R
			printf "\nRestart termux and check\n"
			fi
			}
			menu3