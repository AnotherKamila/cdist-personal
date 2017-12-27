function alive --description 'POST to alive.me that I am alive'
    set TOKEN 'a9070a5433ce442bb08ffd813788cc10'
    wget -q -O /dev/null --header=Auth-Token:{$TOKEN} https://isalive.me/update &
end
