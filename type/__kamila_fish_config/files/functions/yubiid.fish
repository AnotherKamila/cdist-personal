function yubiid -d "Cat's the SSH key stored on the yubikey (assuming an agent is running)"
    ssh-add -L | grep cardno
    if [ -n "$DISPLAY" ]
        if which xclip >/dev/null
            ssh-add -L | grep cardno | xclip -selection clipboard -i ; and echo "[copied to clipboard]" >&2
        else if which xsel >/dev/null
            echo '[TODO xsel support needed]' >&2
        end
    end
end
