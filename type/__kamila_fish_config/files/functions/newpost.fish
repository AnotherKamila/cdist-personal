function newpost -d 'Create and edit a new Jekyll post in the current directory.'
    set title $argv
    set today (date +%Y-%m-%d)
    set filename $today-$title.md
    echo $filename
    touch $filename
    eval $EDITOR $filename
end
