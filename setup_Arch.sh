#!/bin/bash

# 絶対パスを取得
SRC_HOME="$(pwd)/dotfiles/HOME"
DEST_HOME="$HOME"

SRC_ROOT="$(pwd)/dotfiles/ROOT"
DEST_ROOT="/"

# ~/.config にリンクを作成
if [ -d "$SRC_HOME" ]; then
    mkdir -p "$DEST_HOME"
    find "$SRC_HOME" -type f -print0 | while IFS= read -r -d '' file; do
        relative_path="${file#$SRC_HOME/}"
        dest_path="$DEST_HOME/$relative_path"
        
        # リンクが既に存在する場合はスキップ
        if [ -L "$dest_path" ]; then
            continue
        fi
        
        mkdir -p "$(dirname "$dest_path")"
        
        ln -sf "$file" "$dest_path"
        
        if [ -e "$dest_path" ]; then
            echo "リンクを作成しました: $dest_path -> $file"
        else
            echo "リンクに失敗しました: $dest_path"
        fi
    done
else
    echo "$SRC_HOME が見つかりません。"
fi

# / にリンクを作成
if [ -d "$SRC_ROOT" ]; then
    find "$SRC_ROOT" -type f -print0 | while IFS= read -r -d '' file; do
        relative_path="${file#$SRC_ROOT/}"
        dest_path="$DEST_ROOT/$relative_path"
        
        # リンクが既に存在する場合はスキップ
        if [ -L "$dest_path" ]; then
            continue
        fi
        
        sudo mkdir -p "$(dirname "$dest_path")"
        
        sudo ln -sf "$file" "$dest_path"
        
        if [ -e "$dest_path" ]; then
            echo "リンクを作成しました: $dest_path -> $file"
        else
            echo "リンクに失敗しました: $dest_path"
        fi
    done
else
    echo "$SRC_ROOT が見つかりません。"
fi
