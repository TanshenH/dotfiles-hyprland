#!/bin/bash

# Arch-distros only

# Copy the individual files/directories from 'config' to the current user's .config
for dir in config/*; do
  if [ -d "$dir" ]; then
    echo "Copying configs : $dir"
    cp -r "$dir" "$HOME/.config/"
  elif [ -f "$dir" ]; then
    echo "Copying config file: $dir"
    cp "$dir" "$HOME/.config/"
  fi
done

if [ ! -d $HOME/Pictures/wallpapers ]; then
  echo "Creating ~/Pictures/wallpaper directory as wallpaper storage"
  mkdir $HOME/Pictures/wallpapers
fi

for file in Pictures/*; do
  if [ -f "$file" ]; then
    echo "Copying wallpaper..."
    cp "$file" "$HOME/Pictures/wallpapers/"
  fi
done

if [ ! -d "$HOME/Videos/wallpapers" ]; then
  echo "Creating ~/Videos/wallpapers directory as wallpaper storage"
  mkdir $HOME/Videos/wallpapers
fi

for video in Videos/wallpapers/*; do
  if [ -f "$video" ]; then
    echo "Copying video_live_wallpaper..."
    cp "$video" "$HOME/Videos/wallpapers"
  fi
done

echo "copying .zshrc"
cp zsh/.zshrc $HOME/.zshrc

# Check if yay is installed and install packages
if command -v yay &>/dev/null; then
  echo "Installing Necessary packages..."
  yay -S mpvpaper swaylock-effects-improved-git pywal brave-bin pyprland aylurs-gtk-shell-git
  sudo pacman -S --noconfirm neovim eza
  clear
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  echo "[-] Installation Finished! now please type 'nvim' and wait till everything is installed and write ':q' to quit !"
else
  # Install yay if it's not installed
  git clone https://aur.archlinux.org/yay-git.git
  cd yay-git/
  makepkg -si
  cd ..
  clear
  echo "Installing Necessary packages..."
  yay -S mpvpaper swaylock-effects-improved-git pywal brave-bin pyprland aylurs-gtk-shell-git
  sudo pacman -S --noconfirm neovim eza
  clear
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  echo "[-] Installation Finished! now please type 'nvim' and wait till everything is installed and write ':q' to quit ! "
fi
