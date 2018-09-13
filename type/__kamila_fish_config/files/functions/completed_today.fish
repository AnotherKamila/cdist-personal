function completed_today -d "Print the count of taskwarrior tasks completed today."
    set -l today (date '+%Y-%m-%d')
    task +COMPLETED end:$today count
end
