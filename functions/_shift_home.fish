function _shift_home
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f beginning-of-line
    else
        commandline -f begin-selection
        commandline -f beginning-of-line
    end
end
