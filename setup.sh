setup () {
	printf "\n\033[1;92m Installing Requirements..\033[0m\n\n"
	printf "\n\033[1;92m apt update \033[0m\n\n"
	apt update
	printf "\n\033[1;92m apt upgrade \033[0m\n\n"
	apt upgrade -y
	clear
	printf "\n\033[1;92m python \033[0m\n\n"
	apt install python -y
	clear
	printf "\n\033[1;92m figlet \033[0m\n\n"
	apt install figlet -y
	clear
	printf "\n\033[1;92m git \033[0m\n\n"
	apt install git -y
	clear
	printf "\n\033[1;92m wget \033[0m\n\n"
	apt install wget -y
	clear
	printf "\n\033[1;92m zsh \033[0m\n\n"
	apt install zsh -y
	clear
	printf "\n\033[1;92m curl \033[0m\n\n"
	apt install curl -y
	clear
	printf "\n\033[1;92m lsd \033[0m\n\n"
	apt install lsd -y
	clear
	printf "\n\033[1;92m micro \033[0m\n\n"
	apt install micro -y
	printf "\n\033[1;92m zip/unzip \033[0m\n\n"
	pkg install zip -y
	#cp -r add.sh /data/data/com.termux/files
	printf "\n\033[1;92m AcodeX \033[0m\n\n"
	curl -sL https://raw.githubusercontent.com/bajrangCoder/acode-plugin-acodex/main/installServer.sh | bash
	printf "\n\033[1;92m All installed \033[0m\n\n"
	sleep 3
	clear
	cd $PREFIX/bin
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> zsh2
	echo "bash ~/zsh-theme/zsh.sh" >> zsh2
	chmod 777 zsh2
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> add
	echo "bash ~/add.sh" >> add
	chmod 777 add
	printf "\n\n\033[1;92m Now you can use\033[0m :- zsh2"
	printf "\n\n\033[1;92m Now you can use to create alias\033[0m:- add\n"
	}
	setup