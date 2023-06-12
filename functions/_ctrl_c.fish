function _ctrl_c
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        set --local current_selection (commandline --current-selection | string collect)
        echo -ns -- $current_selection | xclip -selection clipboard
        commandline -f end-selection
    else
        return
    end
end