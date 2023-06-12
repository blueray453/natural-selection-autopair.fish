function _delete
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f kill-selection
    else
        commandline -f delete-char
    end
end
