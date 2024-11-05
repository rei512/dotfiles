#!/bin/bash

# 絶対パスを取得
SRC_HOME="$(pwd)/dotfiles/HOME"
DEST_HOME="$HOME"

SRC_ROOT="$(pwd)/dotfiles/ROOT"
DEST_ROOT="/"

# ~/.config にリンクを作成
if [ -d "$SRC_HOME" ]; then
    mkdir -p "$DEST_HOME"
    for file in $(find "$SRC_HOME" -type f); do
        relative_path="${file#$SRC_HOME/}"
        dest_path="$DEST_HOME/$relative_path"
        
        mkdir -p "$(dirname "$dest_path")"
        
        ln -sf "$file" "$dest_path"
        
        # リンクが有効かどうかを確認
        if [ ! -e "$dest_path" ]; then
            echo "リンクに失敗しました: $dest_path"
        fi
    done
else
    echo "$SRC_HOME が見つかりません。"
fi

# /usr/ROOT にリンクを作成
if [ -d "$SRC_ROOT" ]; then
    for file in $(find "$SRC_ROOT" -type f); do
        relative_path="${file#$SRC_ROOT/}"
        dest_path="$DEST_ROOT/$relative_path"
        
        sudo mkdir -p "$(dirname "$dest_path")"
        
        sudo ln -sf "$file" "$dest_path"
        
        # リンクが有効かどうかを確認
        if [ ! -e "$dest_path" ]; then
            echo "リンクに失敗しました: $dest_path"
        fi
    done
else
    echo "$SRC_ROOT が見つかりません。"
fi
