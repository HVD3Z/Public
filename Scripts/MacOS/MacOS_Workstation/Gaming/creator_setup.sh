#!/bin/bash

# Install essential tools via Homebrew
brew update
brew install git node yarn

# Set up Oh My Zsh for an improved terminal experience
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Install Adobe Creative Cloud (for design work)
brew install --cask adobe-creative-cloud

# Install Sketch (design tool for macOS)
brew install --cask sketch

# Install Figma (design collaboration tool)
brew install --cask figma

# Install Zeplin (design handoff tool)
brew install --cask zeplin

# Install Final Cut Pro (video editing software)
brew install --cask final-cut-pro

# Install DaVinci Resolve (professional video editing and color grading)
brew install --cask davinci-resolve

# Install OBS Studio (for live streaming and recording)
brew install --cask obs

# Install ScreenFlow (screen recording and video editing)
brew install --cask screenflow

# Install Camtasia (screen recording and video editing)
brew install --cask camtasia

# Install Logic Pro X (audio production)
brew install --cask logic-pro-x

# Install Ableton Live (music production)
brew install --cask ableton-live

# Install Blender (3D modeling and animation)
brew install --cask blender

# Install Inkscape (vector graphics editor)
brew install --cask inkscape

# Install GIMP (image manipulation)
brew install --cask gimp

# Install HandBrake (video transcoding)
brew install --cask handbrake

# Install VLC (media player)
brew install --cask vlc

# Install Calibre (ebook management)
brew install --cask calibre

# Install OBS VirtualCam (for virtual camera output)
brew install obs-virtualcam

# Clean up Homebrew
brew cleanup

echo "Content creator workstation setup completed! 🎨🎥🎧"
