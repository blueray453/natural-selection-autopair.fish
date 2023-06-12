function _ctrl_end
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f end-of-buffer
    else
        commandline -f end-of-buffer
    end
end
