#!/bin/bash

# コマンドのプレフィックスを指定
COMMAND_PREFIX="code --install-extension "

# 引数が指定されていない場合はエラー
if [[ $# -ne 1 ]]; then
    echo "使用法: $0 ファイル名"
    exit 1
fi

# 引数からファイル名を取得
FILE="$1"

# ファイルが存在するか確認
if [[ ! -f $FILE ]]; then
    echo "エラー: ファイル $FILE が存在しません。"
    exit 1
fi

# ファイルの各行を読み込んでコマンドを実行
while IFS= read -r line || [[ -n $line ]]; do
    # 空行をスキップ
    if [[ -z $line ]]; then
        continue
    fi

    # コマンドの実行
    ${COMMAND_PREFIX} "$line"
done < "$FILE"
