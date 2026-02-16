#! /bin/bash

# General update
if not arch-update
	echo "no-cachy :("
	sudo pacman -Syu && yay -Syu



# Pacman Packages
sudo pacman -S
	# Needed to install
	neovim
	yay


	# Terminal, Web Browser(s), Game launcher, Internet Messanges
	ghostty
	zen-browser-bin
	chromium
	steam
	discord


	# Window manager / Desktop environment
	hyprland
	hyprsunset
	hyprlock
	hyprshot
	xdg-desktop-portal-hyprland

	waybar
	rofi


	# Utils
	imv

	pipewire
	alsa-utils
	alsa-plugins

	amberol

	swaync

	bottom


	# Coding
	zed

	github-cli
	gh auth login

	uv

	texlive-bin
	dvisvgm  
	texlive

	cairo
	pango

	arduino-cli
	arduino-language-server


	# AMD Adrenalin substitutes
	lact
	sudo systemctl enable --now lactd    # Enable the daemon
	mangohud
	gamescope


	# Other suff
	nautilus	# File browser
	nwg-clipman	# Clipboard manager
	nwg-look	# GTK themer
	obs-studio	# Screen recorder
	kdeconnect  # Phone-Pc



# AUR packages
yay -S
	# Coding
	visual-studio-code-bin
	jetbrains-toolbox



# Other packages
sh -c "$(curl -sS https://vencord.dev/install.sh)"    				# Vencord
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh    	# Rust
curl -sS https://starship.rs/install.sh | sh						# Starship
