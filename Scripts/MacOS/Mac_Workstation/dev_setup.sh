#!/bin/bash




# Install Python (optional for Django development)
brew install python

# Install Ruby (optional for Ruby on Rails development)
brew install ruby

# Install PHP (optional for PHP development)
brew install php

# Install Composer (PHP package manager)
brew install composer

# Install Java (optional for Java development)
brew install openjdk

# Install Elasticsearch (optional for search functionality)
brew tap elastic/tap
brew install elastic/tap/elasticsearch-full

# Install RabbitMQ (optional for message queuing)
brew install rabbitmq

# Install Postman (API testing tool)
brew install --cask postman

# Install iTerm2 (alternative terminal)
brew install --cask iterm2

# Install Chrome (for testing web applications)
brew install --cask google-chrome

# Install Firefox (for cross-browser testing)
brew install --cask firefox

# Install Slack (for team communication)
brew install --cask slack

# Install TablePlus (database management tool)
brew install --cask tableplus

# Install Sourcetree (Git GUI client)
brew install --cask sourcetree

# Install Insomnia (API client)
brew install --cask insomnia

# Install Figma (design collaboration tool)
brew install --cask figma

# Install Sketch (design tool for macOS)
brew install --cask sketch

# Install Zeplin (design handoff tool)
brew install --cask zeplin

# Install Adobe Creative Cloud (optional for design work)
brew install --cask adobe-creative-cloud

# Clean up Homebrew
brew cleanup

echo "Web development server setup completed! 🚀"