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
		add() {
			cd $PREFIX/bin
			echo "#!/data/data/com.termux/files/usr/bin/sh" >> add
			echo "bash ~/zsh-theme/add.sh" >> add
			chmod 777 add
			}
		menu3 () {
			ba
			cd ~
			if [ -e .termux ];then
			R
			cd ~/.termux
			pwd
			#rm -f add.sh > /dev/null 2>&1
			printf "\n\n Downloading add.sh file\n\n"
			wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
			add
			R
			printf "\nRestart termux and check\n"
			else
			R
			mkdir ~/.termux
			cd ~/.termux
			#rm -f ~/.termux/add.sh > /dev/null 2>&1
			printf "\n\n Downloading add.sh file\n\n"
			wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
			add
			R
			printf "\nRestart termux and check\n"
			fi
			}
			menu3