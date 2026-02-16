#! /bin/bash

# Downloading repos
mkdir ~/Repos
cd ~/Repos

gh repo clone silentShulk/MyZed
gh repo clone silentShulk/Nier-Automata-Modding-Linux



# Downloading dotfiles repo
cd ~/ 

gh repo clone silentShulk/Hyprland-Rices



# Setting up manim venv
uv python install

cd ~/

uv init --python 3.13 ManimProjects
cd ManimProjects
uv add manim opencv-python pillow
