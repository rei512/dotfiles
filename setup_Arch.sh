#!/bin/bash

# 絶対パスを取得
SRC_CONFIG="$(pwd)/dotfiles/.config"
DEST_CONFIG="$HOME/.config"

SRC_LIB="$(pwd)/dotfiles/lib"
DEST_LIB="/usr/lib"

# ~/.config にリンクを作成
if [ -d "$SRC_CONFIG" ]; then
    mkdir -p "$DEST_CONFIG"
    for file in $(find "$SRC_CONFIG" -type f); do
        relative_path="${file#$SRC_CONFIG/}"
        dest_path="$DEST_CONFIG/$relative_path"
        
        mkdir -p "$(dirname "$dest_path")"
        
        ln -sf "$file" "$dest_path"
        
        # リンクが有効かどうかを確認
        if [ ! -e "$dest_path" ]; then
            echo "リンクに失敗しました: $dest_path"
        fi
    done
else
    echo "$SRC_CONFIG が見つかりません。"
fi

# /usr/lib にリンクを作成
if [ -d "$SRC_LIB" ]; then
    for file in $(find "$SRC_LIB" -type f); do
        relative_path="${file#$SRC_LIB/}"
        dest_path="$DEST_LIB/$relative_path"
        
        sudo mkdir -p "$(dirname "$dest_path")"
        
        sudo ln -sf "$file" "$dest_path"
        
        # リンクが有効かどうかを確認
        if [ ! -e "$dest_path" ]; then
            echo "リンクに失敗しました: $dest_path"
        fi
    done
else
    echo "$SRC_LIB が見つかりません。"
fi
