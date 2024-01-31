#! /bin/bash

echo -e "[CW] Contact: https://www.blog-cyberworm.com/blog/social-media"

githubRepos() {
	cd /opt
	mkdir my_tools
	cd my_tools
	
	echo -e "\n[!] Tools are to be installed in /opt.\n"
	
	echo -e "\n[!] Python tools will be downloaded.\n"
	sleep 3
	
	git clone https://github.com/bellurm/wifi-connection-checker.git
	echo -e "\n[*] Wi-Fi Connection Checker is installed.\n"

	git clone https://github.com/bellurm/Network-Scanner.git
	echo -e "\n[*] Network Scanner is installed.\n"
	
	git clone https://github.com/bellurm/Man-In-The-Middle-Attack.git
	echo -e "\n[*] MITM is installed.\n"
	
	git clone https://github.com/bellurm/MAC-Changer.git
	echo -e "\n[*] MAC Changer vPython is installed.\n"
	
	git clone https://github.com/bellurm/MITM-Detecter-v-Python.git
	echo -e "\n[*] MITM Detecter is installed.\n"
	
	git clone https://github.com/bellurm/Reverse-Shell-Detecter.git
	echo -e "\n[*] Reverse Shell vPython is installed.\n"
	
	git clone https://github.com/bellurm/Deauth-Detecter.git
	echo -e "\n[*] Deauth Detecter is installed.\n"
	
	git clone https://github.com/bellurm/findFile.git
	echo -e "\n[*] Find File is installed.\n"
	
	echo -e "\n[!] Bash Script tools will be downloaded.\n"
	sleep 3
	
	git clone https://github.com/bellurm/File-Encrypter-Decrypter.git
	echo -e "\n[*] File Encrpter-Decrypter is installed.\n"
	
	git clone https://github.com/bellurm/Add-Linux-User.git
	echo -e "\n[*] Add Linux User is installed.\n"
	
	git clone https://github.com/bellurm/AADS.git
	echo -e "\n[*] ARP Attack Detection System (AADS) is installed.\n"
	
	git clone https://github.com/bellurm/macchanger.git
	echo -e "\n[*] MAC Changer vBash is installed.\n"
	
	git clone https://github.com/bellurm/Reverse-Shell-Detecter-vBash.git
	echo -e "\n[*] Reverse Shell Detecter vBash is installed.\n"
	
	git clone https://github.com/bellurm/BruteForce_UNIX.git
	echo -e "\n[*] Brute Force UNIX is installed.\n"
	
	git clone https://github.com/bellurm/Monitoring-Directory.git
	echo -e "\n[*] Monitoring Directory is installed.\n"

	git clone https://github.com/bellurm/nmap-basics.git
	echo -e "\n[*] NMAP Basics is installed.\n"

	git clone https://github.com/bellurm/cw-network-attacker.git
	echo -e "\n[*] CW Network Attacker is installed.\n"
}


textEditors() {
	echo -e "\n[!] Text Editors will be downloaded.\n"
	sleep 3
	
	apt-get install leafpad -y
	echo -e "\n[*] Leafpad has been installed."
	
	apt-get install gedit -y
	echo -e "\n[*] Gedit has been installed."

	apt-get install mousepad -y
	echo -e "\n[*] Mousepad has been installed."
}

vscodeInstall() {
	sudo apt-get install curl
	url="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
	file="vscode.deb"
	curl $url -L -o $file
	sudo dpkg -i $file
	echo -e "\n[*] VS Code has been installed.\n"
	
}

sublimeTextInstall() {

	echo "Downloading Sublime Text 3..."
	sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
	echo -e "\n[*] SublimeText has been installed.\n"

}

beefInstall() {
	cd /opt
	echo -e "\n[*] Installing requirements..."
	sudo gem install bundle
	sudo bundle install
	sudo apt-get install ruby -y
	sudo apt-get install ruby-dev -y
	sudo apt-get install libsqlite3-dev -y
	sudo apt-get install libsqlite3-0 -y
	echo -e "\n[+] Done.\n"
	echo "\n[+]Installing BeEF...\n"
	url="https://github.com/beefproject/beef"
	git clone $url
	cd beef
	./install
	echo -e "\n[+] BeEF has been installed.\n"
	echo -e "\n[WARN] You have to change the default username and password that in the config.yaml file."
}

airgeddonInstall() {
	cd /opt
	echo -e "\n[+] Installing Airgeddon..."
	url="https://github.com/v1s1t0r1sh3r3/airgeddon.git"
	git clone $url
	cd airgeddon
	./airgeddon.sh
	echo -e "\n[+] Airgeddon has been installed.\n"
}

fatratInstall() {
	cd /opt
	echo -e "\n[+] Installing The FatRat..."
	url="https://github.com/screetsec/TheFatRat.git"
	git clone $url
	cd TheFatRat
	chmod 777 setup.sh
	./setup.sh
	echo -e "\n[+] TheFatRat has been installed.\n"
}

function main_menu {
	select options in "Upgrade your system" "Get the Github Repositories" "Get text editors (leafpad, gedit and mousepad.)" "Get VS Code" "Get SublimeText" "Get BeEF" "Get Airgeddon" "Get TheFatRat"
	do
		if [[ $options == "Upgrade your system" ]]
		then
			apt-get upgrade -y
			echo "[+] Done."
			
		elif [[ $options == "Get the Github Repositories" ]]
		then
			githubRepos
			echo "[+] Done."
			
		elif [[ $options == "Get text editors (leafpad, gedit and mousepad.)" ]]
		then
			textEditors
			echo "[+] Done."
			
		elif [[ $options == "Get VS Code" ]]
		then
			vscodeInstall
			echo "[+] Done."
		
		elif [[ $options == "Get SublimeText" ]]
		then
			sublimeTextInstall
			echo "[+] Done."
		
		elif [[ $options == "Get BeEF" ]]
		then
			beefInstall
			echo "[+] Done."
		elif [[ $options == "Get Airgeddon" ]]
		then
			airgeddonInstall
			echo "[+] Done."
		elif [[ $options == "Get TheFatRat" ]]
		then
			fatratInstall
			echo "[+] Done."
		else
			echo "[!] Invalid Selection."
		fi
	done
}

if [ $(whoami) != "root" ]
then
	echo "You have to be root."
else
	echo -e "[*] Updating your system.\n"
	#apt-get update -y
	main_menu
fi
