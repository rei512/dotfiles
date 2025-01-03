
このリポジトリは、私の個人的な設定ファイル（dotfiles）を管理するためのものです。主にLinux環境で使用する設定ファイルが含まれています。

## フォルダ構成

```
.
├── bootctl
│   ├── entries
│   │   └── arch.conf
│   └── loader.conf
├── brightness.sh
├── code_extentions.dmp
├── dotfiles
│   ├── HOME
│   │   ├── .bash_profile
│   │   ├── .bashrc
│   │   ├── .bashrc~
│   │   ├── .config
│   │   │   ├── alacritty
│   │   │   │   └── alacritty.toml
│   │   │   ├── Code
│   │   │   │   └── User
│   │   │   │       ├── keybindings.json
│   │   │   │       ├── markdown-pdf.css
│   │   │   │       └── settings.json
│   │   │   ├── Code - OSS
│   │   │   │   └── User
│   │   │   │       ├── keybindings.json
│   │   │   │       ├── markdown-pdf.css
│   │   │   │       └── settings.json
│   │   │   ├── discord
│   │   │   │   └── settings.json
│   │   │   ├── fish
│   │   │   │   ├── config.fish
│   │   │   │   ├── fish_plugins
│   │   │   │   ├── fish_variables
│   │   │   │   └── functions
│   │   │   │       ├── __bobthefish_colors.fish
│   │   │   │       ├── __bobthefish_display_colors.fish
│   │   │   │       ├── bobthefish_display_colors.fish
│   │   │   │       ├── __bobthefish_glyphs.fish
│   │   │   │       ├── fish_greeting.fish
│   │   │   │       ├── fish_mode_prompt.fish
│   │   │   │       ├── fish_prompt.fish
│   │   │   │       ├── fish_right_prompt.fish
│   │   │   │       └── fish_title.fish
│   │   │   ├── mako
│   │   │   │   ├── config
│   │   │   │   └── notification.mp3
│   │   │   ├── nvim
│   │   │   │   └── init.vim
│   │   │   ├── sway
│   │   │   │   ├── config
│   │   │   │   ├── shot.mp3
│   │   │   │   └── status.sh
│   │   │   ├── waybar
│   │   │   │   ├── config
│   │   │   │   └── style.css
│   │   │   └── zathura
│   │   │       └── zathurarc
│   │   ├── .gitconfig
│   │   ├── .nanorc
│   │   ├── .vimrc
│   │   └── .vimrc~
│   └── ROOT
│       └── lib
│           └── code
│               └── product.json
├── .gitignore
├── pacman_2025-01-01.dmp
├── pacman.dmp
├── README.md
├── setup_Arch.sh
├── setup_Arch_yay.sh
├── setup_Pico_Arch.sh
├── setup_vscode_extensions.sh
├── tree.dmp
├── vscode-extensions.dmp
└── yay.dmp

22 directories, 52 files
```

## 主なファイルとディレクトリ

- **.bash_profile**: Bashのプロファイル設定ファイル。
- **.bashrc**: Bashの設定ファイル。
- **.config/**: 各種アプリケーションの設定ファイルを格納するディレクトリ。
  - **alacritty/**: Alacrittyターミナルの設定ファイル。
  - **Code/**: Visual Studio Codeの設定ファイル。
  - **discord/**: Discordの設定ファイル。
  - **fish/**: Fishシェルの設定ファイル。
  - **mako/**: Mako通知デーモンの設定ファイル。
  - **nvim/**: Neovimの設定ファイル。
  - **sway/**: Swayウィンドウマネージャの設定ファイル。
  - **waybar/**: Waybarステータスバーの設定ファイル。
  - **zathura/**: Zathura PDFリーダーの設定ファイル。
- **.gitconfig**: Gitの設定ファイル。
- **.nanorc**: Nanoエディタの設定ファイル。
- **.vimrc**: Vimの設定ファイル。
- **bootctl/**: ブートローダーの設定ファイル。
- **setup_Arch_yay.sh**: Arch Linux用のYayインストールスクリプト。
- **setup_Arch.sh**: Arch Linuxのセットアップスクリプト。
- **setup_Pico_Arch.sh**: Raspberry Pi Picoのセットアップスクリプト。
- **setup_vscode_extensions.sh**: Visual Studio Codeの拡張機能インストールスクリプト。

## 使用方法

### 初期セットアップ

1. リポジトリをクローンします。
    ```sh
    git clone https://github.com/yourusername/dotfiles.git
    cd dotfiles
    ```

2. 必要なスクリプトを実行して環境をセットアップします。
    ```sh
    ./setup_Arch.sh
    ./setup_Arch_yay.sh
    ./setup_Pico_Arch.sh
    ./setup_vscode_extensions.sh
    ```

### Visual Studio Codeの拡張機能インストール

[\`setup_vscode_extensions.sh\`](setup_vscode_extensions.sh )スクリプトを使用して、拡張機能を一括インストールできます。
```sh
./setup_vscode_extensions.sh vscode-extensions.dmp
```

## 注意事項

- このリポジトリは個人的な設定ファイルを含んでいるため、使用する際には自身の環境に合わせて適宜修正してください。
- スクリプトを実行する前に内容を確認し、必要に応じて変更してください。

---

