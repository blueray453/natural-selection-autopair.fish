function _shift_left
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f backward-char
    else
        commandline -f begin-selection
        commandline -f backward-char
    end
end
