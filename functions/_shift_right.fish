function _shift_right
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f forward-char
    else
        commandline -f begin-selection
        commandline -f forward-char
    end
end
