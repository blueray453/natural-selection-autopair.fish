function _ctrl_v
    set --local has_selection (commandline --selection-start)
    set --local data (xclip -selection clipboard -o 2>/dev/null | string collect)

    if test -n "$data"
        if test -n "$has_selection"

            # # the following two lines should have worked but it does not
            # commandline -f kill-selection
            # commandline --insert -- $data

            set --local selection_left_edge (commandline --selection-start)
            set --local selection_right_edge (commandline --selection-end)

            # Get before and after selection so we can replace the entire commandline
            set --local buffer (commandline --current-buffer)
            set --local head (string sub --length $selection_left_edge -- "$buffer")
            set --local tail (string sub --start (math $selection_right_edge + 1) -- "$buffer")

            commandline --replace -- "$head$data$tail"
            commandline --cursor (math $selection_left_edge + (string length -- "$data"))
            commandline --function end-selection
            commandline --function repaint
        else
            commandline --insert -- $data
            # commandline -f repaint
        end

    else
        return
    end
end