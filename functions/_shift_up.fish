function _shift_up
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f up-line
    else
        commandline -f begin-selection
        commandline -f up-line
    end
end
