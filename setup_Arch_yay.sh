#!/bin/bash

# システムのアップデート
echo "Updating system..."
sudo pacman -Syu

# 必要なパッケージのインストール
echo "Installing base-devel and git..."
sudo pacman -S --needed base-devel git

# yayのインストール
echo "Cloning yay from AUR..."
git clone https://aur.archlinux.org/yay.git
cd yay || exit

echo "Building and installing yay..."
makepkg -si

# yayのバージョン確認
echo "yay version:"
yay --version

# yayディレクトリから元のディレクトリに戻る
cd ..

# yayのインストール後、yayディレクトリを削除する場合
echo "Cleaning up..."
rm -rf yay

echo "Setup complete."
