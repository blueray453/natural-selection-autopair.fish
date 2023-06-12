function _shift_down
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f down-line
    else
        commandline -f begin-selection
        commandline -f down-line
    end
end
