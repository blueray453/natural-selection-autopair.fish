function _ctrl_home
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f beginning-of-buffer
    else
        commandline -f beginning-of-buffer
    end
end
