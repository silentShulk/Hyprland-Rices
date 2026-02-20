#! /bin/fish

# ------------- #
#   VARIABLES   #
# ------------- #

# Parent directory of the script, needed because the script is always in the same folder as the Rices folder (doesn't metter where the user installs the repo)
set script_dir (realpath (dirname (status filename)))
# Rice elements common to all rices
set common_elements $script_dir/CommonElements/*
# Get list of themes from the names of the folders inside the Rices directory
set themes (path basename $script_dir/Rices/*)



# -------- #
#   MENU   #
# -------- #

# Uses fzf to print the themes names to the console in a cool format 👍
set answer (printf "%s\n" $themes | fzf --prompt="Select Theme: " --height=10% --reverse)

# Exit if the user cancels fzf
if test -z "$answer"
    echo "No theme selected. Exiting..."
    exit 1
end

# Based on the answer, switch to the respective theme folder
cd $script_dir/Rices/$answer

printf "\nSelected $answer\n"



# -------------------- #
#   COPYING DOTFILES   #
# -------------------- #

# Paths of all the folders of riced elements of a theme
set dotfiles ./config/*
# All the elements of a rice
set rice_apps (path basename $dotfiles)

# Making backups of the user's dotfiles
printf "\nMaking backups of your folders from ~/.config:\n"
for app in $rice_apps
  if test -d ~/.config/$app
    mv ~/.config/$app ~/.config/$app.bak
    printf "\tBacked up $app config in \"~/.config/$app.bak\"\n"
  end
end

# Copying the common dotfiles in .config
printf "\nCopying dotfiles common to all rices in .config\n"
for common_app_config in $common_dotfiles
  cp -r $common_app_config ~/.config/
  printf "\tInstalled $common_app_config config\n"
end

# Copying theme's folders in .config
printf "\nCopying theme's folders in ~/.config\n"
for app_config in $dotfiles
  cp -r $app_config ~/.config
  printf "\tInstalled $app_config config\n"
end

# Copying wallpaper(s)
printf "\nCopying wallpaper(s) to ~/Pictures/wallpapers folder\n"

cd ./wallpapers
set wallpapers_count (ls -1 | wc -l)
mkdir ~/Pictures/wallpapers/
cp ./* ~/Pictures/wallpapers/

printf "Copied $wallpapers_count wallpapers\n"



# ------------- #
#   LOAD RICE   #
# ------------- #

printf "\nIf you want to load the rice you just installed either logout or reload each element (waybar, wallpaper, etc..) manually"

cd ~
