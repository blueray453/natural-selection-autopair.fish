# natural-selection-autopair.fish

Please check the function names. They are self explanatory. Use `fish_key_reader` to find keys and bind them to the functions.

Here is my sample keybindings.
```
bind \r end-selection execute
bind \n end-selection execute
bind \e end-selection cancel  # escape
bind \cr end-selection history-pager
bind \ce end-selection edit_command_buffer

bind \t _autopair_tab # tab
bind -k backspace _autopair_backspace
bind \x7F _autopair_backspace
bind -k dc _delete
bind \e\[3~ _delete

# Right / Left
bind -k right _right
bind \e\[C _right
bind -k left _left
bind \e\[D _left
bind \e\[1\;5C _ctrl_right
bind \e\[1\;5D _ctrl_left
bind -k sright _shift_right
bind \e\[1\;2C _shift_right
bind -k sleft _shift_left
bind \e\[1\;2D _shift_left
bind \e\[1\;6C _ctrl_shift_right
bind \e\[1\;6D _ctrl_shift_left

# Home / End
bind -k home _home
bind \e\[H _home
bind -k end _end
bind \e\[F _end
bind \e\[1\;5H _ctrl_home
bind \e\[1\;5F _ctrl_end
bind \[1\;2H _shift_home
bind \[1\;2F _shift_end
bind \e\[1\;6H _ctrl_shift_home
bind \e\[1\;6F _ctrl_shift_end

bind -k sr _shift_up
bind \e\[1\;2A _shift_up
bind -k sf _shift_down
bind \e\[1\;2B _shift_down

bind -k down _down
bind \e\[B _down
bind -k up _up
bind \e\[A _up

bind \b _ctrl_backspace # Ctrl + Backspace
bind \e\[3\;5~ _ctrl_delete # Ctrl + Delete

bind \cc _ctrl_c
bind \cx _ctrl_x
bind \cv _ctrl_v

# ctrl + a to select all. I did not make a function for this
bind \ca beginning-of-buffer begin-selection end-of-buffer

# this is used so that normal key press do not continue the selection
bind '' kill-selection end-selection self-insert

set --global autopair_left "(" "[" "{" '"' "'"
set --global autopair_right ")" "]" "}" '"' "'"
set --global autopair_pairs "()" "[]" "{}" '""' "''"

printf "%s\n" $autopair_pairs | while read --local left right --delimiter ""
    bind --mode $mode[-1] --erase $left $right
    if test $left = $right
        bind $left "_autopair_insert_same \\$left"
    else
        bind $left "_autopair_insert_left \\$left \\$right"
        bind $right "_autopair_insert_right \\$right"
    end
end
```
## caveat

you might have noticed that i have used `end-selection` before several keybindings, otherwise the selection will continue. So, if you find that after some key press the selection continues, then add `end-selection` like:

```
bind \r end-selection execute
bind \n end-selection execute
```

However, hopefully `bind '' kill-selection end-selection self-insert` will handle most of the cases.

In the functions, you will find some repetation. This is intentional. This is so that you can read each file autonomously (and hopefully send us some pull requests).

## autopair like functionality

Automatically insert, erase, and skip matching pairs as you type in the command-line: `()`, `[]`, `{}`, `""`, and `''`. E.g., pressing `(` inserts `()` and positions the cursor in between the parentheses. Hopefully.

- Insert matching pairs.

  ```console
  $ echo ⎢ # Let's say ⎪ is the cursor!
  ```

  <kbd>"</kbd> 🥊

  ```console
  $ echo "⎪"
  ```

- Erase pairs on backspace:

  ```console
  $ echo "Hey⎪"
  ```

  <kbd>Backspace</kbd> 🥊🥊🥊

  ```console
  $ echo "⎪"
  ```

  <kbd>Backspace</kbd> 🥊

  ```console
  $ echo ⎪
  ```

- Skip over matched pairs:

  ```console
  $ echo "Hey⎪"
  ```

  <kbd>"</kbd> 🥊

  ```console
  $ echo "Hey"⎪
  ```

- Gracefully handle <kbd>Tab</kbd> completions for variables while inside double quotes.

  ```console
  $ echo "$fish_color_⎪"
  ```

  <kbd>Tab</kbd> 🥊

  ```console
  $ echo "$fish_color_⎪
  "$fish_color_autosuggestion   (Variable: '555' 'brblack')
  "$fish_color_cancel           (Variable: -r)
  "$fish_color_command          (Variable: blue)
  "$fish_color_comment          (Variable: red)
  ...
  ```

## How can I contribute

Please make a video / gif like https://github.com/PatrickF1/fzf.fish and update the readme.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install blueray453/natural-selection-autopair.fish
```

## License

[MIT](LICENSE.md)
