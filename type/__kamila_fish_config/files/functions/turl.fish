function turl --description 'Add task with a URL'
    set targs $argv[1..-2]
    set url   $argv[-1]
    set title (wget -qO- "$url" | hxselect -s '\n' -c 'title' 2>/dev/null)
    set id    (task add "$title" $targs | sed -n 's/Created task \(.*\)./\1/p')
    task $id annotate "$url"
end
