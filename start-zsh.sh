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
		auto() {
			R
			fl
			cd ~/../usr/etc
			mkdir .plugin
			cd .plugin
			printf "\n\nPlease wait for cloning..\n"
			git clone https://github.com/zsh-users/zsh-autosuggestions > /dev/null 2>&1
			git clone https://github.com/zsh-users/zsh-syntax-highlighting > /dev/null 2>&1
			R
			printf "\nCloning successfull\n\n"
			clear
			}
			tr() {
				cd ~
				if [ -e .termux ];then
				R
				cd ~/.termux
				printf "\nDownloading font🖊️ \n\n"
				wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/font.ttf
				printf "\nDownloading create alias file add.sh \n\n"
				wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
				R
				printf "\n Seccessfully download\n"
				clear
				else
				R
				cd ~
				mkdir ~/.termux
				cd ~/.termux
				pwd
				printf "\nDownloading font🖊️ \n\n"
				wget https://raw.githubusercontent.com/rooted-cyber/good/master/zsh/font.ttf
				printf "\nDownloading create alias file add.sh \n\n"
				wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/add.sh
				R
				printf "\n Seccessfully download\n"
				clear
				fi
				}
			setuping-theme() {
				R
				printf "\n\nSetuping theme please wait..\n\n"
				cd ~
				wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.zshrc > /dev/null 2>&1
				wget https://raw.githubusercontent.com/tharindu899/addon/main/termux/zsh/.p10k.zsh > /dev/null 2>&1
				tr
				}
				chp() {
			 cd ~
			 if [ -e powerlevel10k ];then
			 R
			 printf "Successfully cloning powerlevel10k\n\n"
			 else
			 printf "\n\n\033[1;91m Sorry not install powerlevel10k !!\n\n"
			 exit
			 fi
			 }
			 cho() {
			 	cd ~
			 	if [ -e .oh-my-zsh ];then
			 	R
			 	printf "\n\nCloning successfull\n\n"
			 	else
			 	printf "\n\n\033[1;91m Not cloning please try again!!\n\n"
			 	exit
			 	fi
			 	}
			 ohmyzsh () {
			 	cd ~
			 	if [ -e .oh-my-zsh ];then
			 	R
			 	printf "\n\n Already installed oh-my-zsh\n\n"
			 	else
			 	R
			 	printf "\n\n Cloning oh-my-zsh\n"
			 	cd ~
			 	git clone https://github.com/ohmyzsh/ohmyzsh
			 	mv ohmyzsh .oh-my-zsh
			 	fi
			 	}
		menu2() {
			R
			printf "\n\n Installing..\n\n"
			R
			printf "\n cloning powerlevel10k approx. 80MB\n"
			sleep 1
			cd ~
			git clone https://github.com/romkatv/powerlevel10k
			chp
			ohmyzsh
			cho
			auto
			setuping-theme
			chsh -s zsh
			R
			printf "\nRestart termux \n"
			}
			menu2