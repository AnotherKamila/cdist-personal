function get_git_status -d "Gets the current git status"
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l dirty (command git status -s --ignore-submodules=dirty | wc -l | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set -l ref (command git symbolic-ref --short HEAD 2> /dev/null ; or command git describe --tags --exact-match ^/dev/null ; or command git rev-parse --short HEAD 2> /dev/null)
    set -l tag (command git describe --abbrev=0 2>/dev/null)
    set -l ahead (command git status | grep ahead)
    set -l stashes (command git stash list)

    # first set prompt color
    set_color cyan
    [ -n "$stashes" ];   and set_color yellow
    [ "$dirty" != "0" ]; and set_color red

    if [ "$dirty" != "0" ]
      echo "*$dirty "
    end
    if [ -n "$stashes" ]
        echo '[$] '
    end
    if [ -n "$ahead" ]
      echo "↑ "
    end
    echo "$ref"
    if [ -n "$tag" ]
      echo " [$tag]"
    end
   end
end

function fish_right_prompt -d "Prints right prompt"
  get_git_status
  set_color normal
end
