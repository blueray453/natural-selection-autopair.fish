function _right
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f forward-single-char
        commandline -f end-selection
    else
        commandline -f forward-single-char
    end
end
