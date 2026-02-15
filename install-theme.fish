#! /bin/fish

# ------------- #
#   VARIABLES   #
# ------------- #

# Parent directory of the script, needed because the script is always in the same folder as the Rices folder (doesn't metter where the user installs the repo)
set script_dir (dirname (status filename))
# Themes
set themes (basename $script_dir/Rices/*)

# -------- #
#   MENU   #
# -------- #

# Uses fzf to print the themes names to the console in a cool format 👍
set answer (printf "%s\n" $themes | fzf --prompt="Select Action: " --height=10% --reverse)

# Based on the answer, switch to the respective theme folder
cd $script_dir/Rices/$answer

printf "\nSelected $answer\n"



# -------------------- #
#   COPYING DOTFILES   #
# -------------------- #

# Paths of all the folders of riced elements of a theme
set dotfiles ./*
# All the elements of a rice
set rice_apps (basename $dotfiles)

# Making backups of the user's dotfiles
printf "Making backups of your folders from ~/.config:"

for app in $rice_apps
  if test -d ~/.config/$app
    mv ~/.config/$app ~/.config/$app.bak
    printf "Backed up $app config in \"~/.config/$app[$i].bak\""
  end
end

# Copying theme's folders in .config
printf "\nCopying theme's folders in ~/.config"

for app_config in $dotfiles
  cp -r $app_config ~/.config
end



# ------------- #
#   LOAD RICE   #
# ------------- #

echo "\n If you want to load the rice you just installed either logout or reload each element (waybar, wallpaper, etc..) manually"
