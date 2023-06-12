function _end
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f end-of-line
    else
        commandline -f end-of-line
    end
end
