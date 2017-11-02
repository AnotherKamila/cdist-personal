if not status --is-interactive
  exit
end

. ~/.profile

set -x PATH ~/bin ~/.local/bin ~/cdist/bin $PATH

# displays "me" instead of username if it is this
set default_user "kamila"

function fish_greeting
    set cnt (task +in +PENDING count)
    [ $cnt -ne 0 ]; and echo "$cnt tasks in inbox"
end

. ~/.config/fish/aliases.fish
# . ~/.config/fish/autoenv.fish

if [ -f ~/.config/fish/cdist-generated.fish ]
    . ~/.config/fish/cdist-generated.fish
end
