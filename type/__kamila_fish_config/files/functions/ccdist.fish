function ccdist --description 'Symlink ~/.cdist-$something directory to ~/.cdist for easy context switching'
    rm -f ~/.cdist
    ln -s ~/.cdist-$argv[1]* ~/.cdist
end
