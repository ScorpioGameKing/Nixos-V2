#!/bin/sh

# This is a hacky way to bootstrap an install if there's issues when installing
# from github. This is intended to be run by root or with sudo and from 
# '/mnt/etc/nixos/Nixos-V2'.

echo "Copying Configuration Files"
cp ./configuration.nix ./..
cp ./flake.nix ./..
cp ./home.nix ./..
echo "Copying Dotfiles and Wallpapers"
cp -r nixos-dotfiles-repo ./..
echo "Moving up and running install"
cd ..
nixos-install --flake /mnt/etc/nixos#nixBox2
echo "Setting up User Password"
nixos-enter --root /mnt -c 'passwd scorpio'
echo "Copying configs to user home"
mkdir ./../../home/scorpio/repos
cp -r ./Nixos-V2 ./../../home/scorpio/repos/nixos-configs
cp ./hardware-configuration.nix ./../../home/scorpio/repos/nixos-configs
nixos-enter --root /mnt -c 'chown -R scopio:users ./../../home/scorpio/repos'
echo "Please take note of any step that may have failed. Also"
echo "please ensure that the files in '~/repos/nixos-configs'"
echo "are properly owned by the user. If all appears well then"
echo "reboot your system and remove the installation media."
echo "You may have to run this twice due to a NAR mismatch."
echo "The chwon -R may also not work due to being in the installer"
echo "so ensure permissions are set after logging in."
