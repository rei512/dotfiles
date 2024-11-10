#!/bin/bash

# 作業ディレクトリを作成して移動
mkdir -p pico
cd pico

# pico-sdkリポジトリをクローン
git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
git submodule update --init
cd ..

# pico-examplesリポジトリをクローン
git clone https://github.com/raspberrypi/pico-examples.git --branch master

# 必要なパッケージをインストール
sudo pacman -S --needed make cmake arm-none-eabi-gcc arm-none-eabi-newlib base-devel

# PICO_SDK_PATH環境変数を設定して.bashrcに追加
echo "export PICO_SDK_PATH=$(pwd)/pico-sdk" >> ~/.bashrc
source ~/.bashrc

# pico-samplesディレクトリ内でビルドディレクトリを作成して移動
cd pico-examples
mkdir -p build
cd build

# CMakeを実行
cmake ..

# blinkプロジェクトをビルド
cd blink
make -j4
