function _ctrl_right
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f forward-word
    else
        commandline -f forward-word
    end

end
