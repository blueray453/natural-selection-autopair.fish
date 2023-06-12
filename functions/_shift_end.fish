function _shift_end
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-of-line
    else
        commandline -f begin-selection
        commandline -f end-of-line
    end
end
