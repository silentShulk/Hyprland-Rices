#! /bin/fish

# ------------- #
#   VARIABLES   #
# ------------- #

# Parent directory of the script, needed because the script is always in the same folder as the Rices folder (doesn't metter where the user installs the repo)
set script_dir (realpath (dirname (status filename)))
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

# Rice elements common to all rices
set common_elements $script_dir/CommonElements/*
# Paths of all the folders of riced elements of a theme
set dotfiles ./config/*
# All the elements of a rice
set rice_elements (path basename $dotfiles)

# Making backups of the user's dotfiles
printf "\nMaking backups of your configs from ~/.config:\n"
for app in $rice_elements                                                                                               # For each element in the selected rice
  if test -d ~/.config/$app_config                                                                                      # Test if a config for it already exists
    if test -d ~/.config/$app.bak                                                                                       # If it does also check if a backup for that config already exists
      rm -rf ~/.config/app.bak                                                                                          # If it does remove that backup
      mv ~/.config/$app ~/.config/$app.bak                                                                              # And move the current config inside that backup folder
      printf "\tRemoved already present backup folder for $app. Backed up $app config in \"~/.config/$app.bak\"\n"      # And tell the user what was done
    else                                                                                                                # If a config for that up doesn't exist
      mv ~/.config/$app ~/.config/$app.bak                                                                              # Move the current config inside a backup folder
      printf "\tBacked up $app config in \"~/.config/$app.bak\"\n"                                                      # And tell the user what was done
    end
  end
end

# Copying the common dotfiles in .config
printf "\nCopying dotfiles common to all rices in .config\n"
for common_element in $common_dotfiles              # For each element common to all rices
  cp -r $common_element ~/.config/                  # Copy that element's config in .config
  printf "\tCopied $common_element config\n"        # And tell the user what was done
end

# Copying theme's folders in .config
printf "\nCopying theme's folders in ~/.config\n"
for element_config in $dotfiles                     # For each element of the selected rice
  cp -r $element_config ~/.config                   # Copy that element's config
  printf "\tInstalled $element_config config\n"     # And tell the user what was done
end

# Copying wallpaper(s)
printf "\nCopying wallpaper(s) to ~/Pictures/wallpapers folder\n"

cd ./wallpapers                                     # Go into the selected rice's wallpapers folder
set wallpapers_count (ls -1 | wc -l)                # Count how many wallpapers it contains
mkdir ~/Pictures/wallpapers/                        # Make a wallpapers folder in ~/Pictures
cp ./* ~/Pictures/wallpapers/                       # Copy the selected rice's wallpapers to the just created folder
printf "Copied $wallpapers_count wallpapers\n"      # And tell the user what was done



# ------------- #
#   LOAD RICE   #
# ------------- #

printf "\nIf you want to load the rice you just installed either logout or reload each element (waybar, wallpaper, etc..) manually"

cd ~        # Go back to the user's home folder
