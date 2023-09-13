setup () {
	printf "\n\033[1;92m Installing Requirements..\n\n"
	apt update -y
	apt upgrade -y
	apt install python -y
	apt install figlet -y
	apt install git -y
	apt install wget -y
	apt install zsh -y
	apt install curl -y
	apt install lsd -y
	apt install micro -y
	pkg install zip -y
	curl -sL https://raw.githubusercontent.com/bajrangCoder/acode-plugin-acodex/main/installServer.sh | bash
	printf "\n\033[1;92m All installed\n"
	sleep 3
	clear
	cd $PREFIX/bin
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> zsh2
	echo "bash ~/zsh-theme/zsh.sh" >> zsh2
	chmod 777 zsh2
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> add
	echo "bash ~/.termux/add.sh" >> add
	chmod 777 add
	printf "\n\n\033[1;92m Now you can use :- zsh2"
	printf "\n\n\033[1;92m use to create alias :- add\n"
	}
	setup