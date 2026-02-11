function wa --wraps='cd ~/.config/waybar && nvim .' --wraps='cd ~/.config/waybar && nvim ./' --wraps='nvim ~/.config/waybar' --wraps='cd ~/.config/waybar' --description 'alias wa=cd ~/.config/waybar'
    cd ~/.config/waybar $argv
end
