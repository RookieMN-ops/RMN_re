#!/bin/bash


# staging
echo [*] Staging process...
mkdir ~/.RMN_re
cd ..
mv RMN_re/* ~/.RMN_re
rm -rf RMN_re
cd ~/.RMN_re
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
