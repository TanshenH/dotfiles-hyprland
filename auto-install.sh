#!/bin/bash
#
# AUTO-INSTALL INSPIRED FROM JAKOOLIT
#
#
#

if command -v git &>/dev/null; then
  echo "Git installed ... proceeding with installation ..."
else
  sudo pacman -S --noconfirm git
fi
clear
git clone --depth=1 https://github.com/tanxzen/Hypr-Arch.git ~/Hypr-Arch
cd ~/Hypr-Arch && chmod +x base-install.sh
./bash-install.sh
clear
echo "Do you want to continue without restarting ? (y/n) "
read -r choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  echo "! Executing post-install.sh"
  ./post-install.sh
else
  echo "Base Installtion Finished ..."
  echo "Please Reboot and run post-install.sh for the final install!"
fi
