function _home
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f beginning-of-line
    else
        commandline -f beginning-of-line
    end
end
