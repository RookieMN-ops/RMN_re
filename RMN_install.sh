#!/bin/bash


# staging
echo [*] Staging process...
mkdir ~/.MK01-RMN
cd ..
mv MK01-RMN/* ~/.MK01-RMN
rm -rf MK01-RMN
cd ~/.MK01-RMN
echo [+] Completed

#  get tools
echo [*] Installing tools...
sudo apt update
sudo apt-get install sshpass
sudo apt-get install python3
echo [+] Completed

# set up alias workflow
echo [*] Setting up alias...
echo "alias RMN=\"python3 $(pwd)/main.py\"" >> ~/.bashrc
echo "alias RMN=\"python3 $(pwd)/main.py\"" >> ~/.zshrc
echo [+] Completed

# clean up
echo [+] Installation Completed
echo "- please restart your terminal"
echo "- type 'RMN' to launch OnlyRat"
