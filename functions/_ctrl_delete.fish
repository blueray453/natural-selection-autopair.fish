function _ctrl_delete
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f kill-selection
    else
        commandline -f kill-word
    end
end
