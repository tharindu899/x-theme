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
		ex() {
			cd $PREFIX/bin
			echo "#!/data/data/com.termux/files/usr/bin/sh" >> ex
			echo "killall -9 com.termux" >> ex
			chmod 777 ex
			}
		menu3 () {
			ba
			cd ~
			if [ -e .termux ];then
			R
			cd ~/.termux
			pwd
			rm -f termux.properties > /dev/null 2>&1
			printf "\n\n Downloading button file\n\n"
			wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/termux.properties
			ex
			R
			printf "\nRestart termux and check\n"
			else
			R
			mkdir .termux
			cd ~/.termux
			rm -f termux.properties > /dev/null 2>&1
			printf "\n\n Downloading button file\n\n"
			wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/termux.properties
			ex
			R
			printf "\nRestart termux and check\n"
			fi
			}
			menu3