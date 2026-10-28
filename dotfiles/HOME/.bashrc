# 環境変数は .bash_profile に置く (fish にも引き継がれる)

# 対話的に起動された bash は fish に切り替える
# (bash -c や VS Code のタスク・ターミナル、fish から呼んだ bash では切り替えない)
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && -z ${VSCODE_SHELL_INTEGRATION} ]]
then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec fish $LOGIN_OPTION
fi

if type -P direnv >/dev/null; then
    eval "$(direnv hook bash)"
fi
