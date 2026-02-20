#! /bin/bash

# General update
if ! arch-update; then
    echo "no-cachy :("
    sudo pacman -Syu && yay -Syu
fi



# Pacman Packages

# Needed to install
sudo pacman -S --needed \
	neovim \
	yay


# Terminal, Web Browser(s), Game launcher, Internet Messanges
sudo pacman -S \
	ghostty \
	zen-browser-bin \
	chromium \
	steam \
	discord 

# Window manager / Desktop environment
sudo pacman -S \
	hyprland \
	hyprsunset \
	hyprlock \
	hyprshot \
  hyprpicker \
	xdg-desktop-portal-hyprland \
  swaync \
  swww \
	waybar \
	rofi \
  wlogout \
  cava

# Utils
sudo pacman -S \
	imv \
	pipewire \
	alsa-utils \
	alsa-plugins \
	amberol \
	swaync \
	bottom 

# Coding
sudo pacman -S \
	zed \
	github-cli \
	uv \
	texlive-bin \
	dvisvgm \
	texlive \
	cairo \
	pango \
	arduino-cli \
	arduino-language-server 

gh auth login	# Login with github after installing github cli

# AMD Adrenalin substitutes
sudo pacman -S \
	lact \
	sudo systemctl enable --now lactd \    # Enable the daemon
	mangohud \
	gamescope 

# Nvidia App substitutes
sudo pacman -S \
	nvidia-settings \
	nvidia-utils 

# Other suff
sudo pacman -S \
	nautilus \	    # File browser
	nwg-clipman \	  # Clipboard manager
	nwg-look \	    # GTK themer
	obs-studio \	  # Screen recorder
	kdeconnect \   	# Phone-Pc
  obsidian        # Markdown editor





# AUR packages

# Coding
yay -S \
	visual-studio-code-bin \
	jetbrains-toolbox 





# Other packages
sh -c "$(curl -sS https://vencord.dev/install.sh)"    			# Vencord
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh    	# Rust
curl -sS https://starship.rs/install.sh | sh				# Starship
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim	# NvChad
