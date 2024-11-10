#!/bin/bash

# 入力ファイルと出力ファイルを指定
file="brightness"
path="/sys/class/backlight/intel_backlight/"

# 引数のチェック
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <value>"
    exit 1
fi

# 足し引きする値を指定
value=$1 # 値

# 引数のチェック（数値であるか確認）
if ! [[ $value =~ ^-?[0-9]+$ ]]; then
    echo "Error: 引数は数値である必要があります。"
    exit 1
fi

# 入力ファイルから値を読み込む
if [[ -f $path$file ]]; then
    file_value=$(cat "$path$file")
else
    echo "Error: $file が存在しません。"
    exit 1
fi


# 足し引きの計算を実行
result=$((file_value + value))

# 計算結果が 50 以上かつ 1516 未満の場合にのみ書き込みを実行
if [[ $result -ge 50 && $result -lt 1516 ]]; then
    # 結果を出力ファイルに書き込む
    echo "$result" | sudo tee "$path$file"
else
    echo "Error: 計算結果が範囲外です (50 以上かつ 1516 未満である必要があります)。計算結果: $result"
    exit 1
fi


# 0-1515