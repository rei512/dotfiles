alias ls 'lsd -a'
# 環境変数は ~/.bash_profile に置く (ログイン bash → sway → fish と引き継がれる)

if type -q direnv
    direnv hook fish | source
end
