#!/bin/bash

# Developer and DevOps workstation setup script for macOS

# Install Homebrew (a package manager for macOS)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install essential developer tools
brew install git
brew install node
brew install python
brew install ruby
brew install go

# Install IDEs and code editors
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask android-studio

# Install version control tools
brew install --cask sourcetree
brew install --cask bitbucket

# Install API testing tools
brew install --cask postman

# Install database management tools
brew install --cask datagrip
brew install --cask sequel-pro

# Install virtualization software
brew install --cask docker
brew install --cask virtualbox

# Install cloud CLI tools
brew install awscli
brew install azure-cli
brew install gcloud

# Install mobile development tools
brew install --cask xcode
brew install --cask android-sdk

# Install design and prototyping tools
brew install --cask sketch
brew install --cask figma

# Install productivity tools
brew install --cask clickup
brew install --cask slack

# DevOps tools
brew install kubernetes-cli
brew install jenkins
brew install puppet
brew install ansible
brew install terraform
brew install --cask awscli
brew install --cask azure-cli
brew install --cask google-cloud-sdk

echo "Developer and DevOps workstation setup complete! 🚀"