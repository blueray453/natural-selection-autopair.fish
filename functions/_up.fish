function _up
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        up-or-search
    else
        up-or-search
    end
end
