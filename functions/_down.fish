function _down
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        down-or-search
    else
        down-or-search
    end
end
