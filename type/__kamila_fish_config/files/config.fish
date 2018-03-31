if not status --is-interactive
  exit
end

. ~/.profile
# hack to make PATH work
set path_value (grep 'export PATH=' ~/.profile | cut -d= -f2 | tr -d '"\'' | tr ':' ' ')
eval set path_value (echo $path_value)  # expand variables and make it into an array
set -xg PATH $path_value


# displays "me" instead of username if it is this
set default_user "kamila"

function fish_greeting
    alive
    set cnt (task +in +PENDING count)
    [ $cnt -ne 0 ]; and echo "$cnt tasks in inbox"
end

. ~/.config/fish/aliases.fish
# . ~/.config/fish/autoenv.fish

if [ -f ~/.config/fish/cdist-generated.fish ]
    . ~/.config/fish/cdist-generated.fish
end
