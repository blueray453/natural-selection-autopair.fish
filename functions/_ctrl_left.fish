function _ctrl_left
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f backward-word
    else
        commandline -f backward-word
    end

end
