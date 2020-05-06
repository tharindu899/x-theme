setup () {
	printf "\n\033[1;92m Installing Requirements..\n\n"
	apt update
	apt upgrade
	apt install python
	apt install figlet
	apt install git
	apt install wget
	apt install zsh
	apt install curl
	printf "\n\033[1;92m All installed\n"
	sleep 3
	clear
	cd $PREFIX/bin
	echo "#!/data/data/com.termux/files/usr/bin/sh" >> zsh2
	echo "bash ~/zsh-theme/zsh.sh" >> zsh2
	chmod 777 zsh2
	printf "\n\n\033[1;92m Now you can use :- zsh2\n"
	}
	setup