cat <<EOF
export EDITOR="$EDITOR"
export ALTERNATE_EDITOR=""
export BROWSER="$BROWSER"
export PYTHONSTARTUP="\$HOME/.pythonrc.py"
export PATH="\$HOME/bin:\$HOME/.local/bin:\$HOME/cdist/bin:\$PATH"

# use gnupg as ssh agent -- because yubikey
export SSH_AUTH_SOCK="\$HOME/.gnupg/S.gpg-agent.ssh"

# git subrepo experiment
export GIT_SUBREPO_ROOT="\$HOME/bin/git-subrepo"
export PATH="\$PATH:\$GIT_SUBREPO_ROOT/lib"
export MANPATH="\$MANPATH:\$GIT_SUBREPO_ROOT/man"
EOF
