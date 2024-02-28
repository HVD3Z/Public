#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile  
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install OpenRazer
brew install openrazer
sudo kextload /Library/Extensions/RazerHid.kext
sudo tccutil --insert /usr/sbin/RzDeviceEngine
sudo tccutil --insert /usr/sbin/RzUpdater
sudo tccutil --insert /usr/sbin/RzDeviceEngine

# Install Git
brew install git

# Configure Git
git config --global user.name "HVD3Z"
git config --global user.email "youngea@outlook.com"

# Install MAS (app store cli)
brew install mas

# Install jq (json query processor)
brew install jq

# Install Wireshark (network protocol analyzer)
brew install --cask wireshark

# Install VirtualBox (for virtualization)
brew install --cask virtualbox

# Install Vagrant (for managing development environments)
brew install --cask vagrant
brew install --cask vagrant-manager

# Install RDP client for Windows management
brew install --cask microsoft-remote-desktop

# Install SSH clients
brew install openssh

# Install SMB/CIFS tools (for Windows file sharing)
brew install samba

# Install Active Directory tools
brew install adcli
brew install sssd

# Install PowerShell (for Windows scripting)
brew install --cask powershell

# Install CyberDuck (for secure file transfers)
brew install --cask cyberduck

# Install Remote Desktop Manager (for managing remote Windows connections)
brew install --cask remote-desktop-manager

# Install 7zip (archiving tool)
brew install 7zip

# Install osctrl (SQL based query tool)
brew install osctrl-cli

# Install NeoFetch (sysinfo tool)
brew install neofetch

# Install Zorba (noSQL processor)
brew install zorba

# Install GH (github cli tools)
brew install gh

# Install steampipe.io
brew tap turbot/tap
brew install steampipe

# Install Podman Desktop (for managing podman containers)
brew install --cask podman-desktop

# Install Configuration Management Solutions
# Install Chef Workstation (for configuration management with Chef)
brew install --cask chef-workstation

# Install Puppet Developer Kit (for configuration management with Puppet)
brew install --cask puppetlabs/puppet/pdk

# Install Ansible (for configuration management with Ansible)
brew install ansible
brew install ansible-cmdb
brew install ansible-lint

# Install vmWare powerCLI (for managing vmware products via cli)
brew install govc
#? pwsh
#? Install-Module -Name VMware.PowerCLI -Scope CurrentUser

# Install Visual Studio Code (VSCode)
brew install --cask visual-studio-code

# Install Docker
brew install --cask docker
brew install --cask docker-toolbox

# Install MongoDB
brew tap mongodb/brew
brew install mongodb-community

# Install PostgreSQL
brew install postgresql

# Install Redis
brew install redis
brew install --cask redis-pro
brew install --cask redisinsight

# Install Nginx
brew install nginx

# Install Node.js
brew install node

# Install Yarn
brew install yarn

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
brew install --cask postman-agent
brew install --cask postman-cli

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

# Install Jenkins (CI/CD automation server)
brew install jenkins

# Install Terraform (infrastructure as code)
brew install terraform

# Install SonarQube (static code analysis)
brew install sonarqube

# Install OWASP ZAP (web application security scanner)
brew install owasp-zap

# Install Trivy (container image vulnerability scanner)
brew install trivy

# Install Kali Linux (for penetration testing)
brew install --cask kali-linux

# Install Hashicorp Vault (secrets management)
brew install vault

# Install GitLab Runner (for GitLab CI/CD)
brew install gitlab-runner

# Install cloud management interfaces

# Install AWS CLI (Amazon Web Services command-line interface)
brew install awscli
brew install aws-vault  # Securely manage AWS credentials
brew install aws-amplify # Scalable web and mobile apps development
brew install aws-cdk # Cloud Development Kit open-source software development framework

# Install GCP SDK (Google Cloud Platform command-line tools)
brew install google-cloud-sdk

# Install Azure CLI (Microsoft Azure command-line interface)
brew install azure-cli

# Install Kubernetes CLI (kubectl)
brew install kubectl

# Install Helm (Kubernetes package manager)
brew install helm

# Install Prometheus (monitoring and alerting)
brew install prometheus

# Install Grafana (visualization and monitoring)
brew install grafana

# Install Splunk (log analysis)
brew install splunk

# Install GitGuardian (secrets scanning)
brew install gitguardian

# Install Checkmarx (static application security testing)
brew install checkmarx

# Install Aqua (container security)
brew install aqua

# Install Twistlock (container security)
brew install twistlock

# Install Snyk (dependency scanning)
brew install snyk

# Install JFrog Xray (artifact scanning)
brew install jfrog-cli

# Install Nessus (vulnerability scanning)
brew install nessus

# Install Fortify (application security)
brew install fortify

# Install Veracode (application security)
brew install veracode

# Install NMap (network scanner)
brew install nmap

# Install Quality of Life tools

brew install --cask betterdisplay
brew install --cask bettermouse
brew install --cask rectangle
brew install --cask chai
brew install --cask canon-eos-utility

# Install animdl (Anime Downloader)
brew install animdl

# Install Atmos (cloud automation tool)
brew install atmos

# Install Atlantis (pull request bot)
brew install atlantis

# Install Adobe Creative Cloud (for design work)
brew install --cask adobe-creative-cloud

# Install DaVinci Resolve (professional video editing and color grading)
brew install --cask davinci-resolve

# Install Streamlabs (for live streaming and recording)
brew install --cask streamlabs-obs

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

# Install Gaming Applications

# Install Discord (chat server)
brew install --cask discord
brew install --cask betterdiscord-installer

# Install Greenlight (Xbox Remote Play)
curl -O https://github.com/unknownskl/greenlight/releases/download/v2.1.1/Greenlight-2.1.1-universal.dmg
hdiutil attach Greenlight-2.1.1-universal.dmg
cp -R /Volumes/Greenlight/Greenlight.app /Applications/
hdiutil detach /Volumes/Greenlight
rm Greenlight-2.1.1-universal.dmg

# Install Epic Games
brew install --cask epic-games

# Install Rockstar 
brew install --cask rockstar-games

# Install Steam 
brew install --cask steam

# Install Ubisoft Connect 
brew install --cask ubisoft-connect

# Install Battle.Net 
brew install --cask battle-net

# Install EA App 
brew install --cask ea-app

# Install GoG Galaxy 
brew install --cask gog-galaxy

# Install League of Legends 
brew install --cask league-of-legends

# Install Chiaki 
brew install --cask chiaki

# Install Geforce Now 
brew install --cask nvidia-geforce-now

# Install Heroic Game Launcher
brew install --cask --no-quarantine heroic

# Install FF14 Launcher
brew install --cask final-fantasy-xiv-online




# Install Core Apps
brew install htop  # Interactive process viewer

brew install tree  # Display directory structure

brew install tmux  # Terminal multiplexer

brew install openssl  # SSL/TLS toolkit

brew install gnupg  # Encryption software

brew install ssh-copy-id  # Copy SSH keys to remote hosts

brew install coreutils  # GNU core utilities

brew install watch  # Execute a program periodically

brew install ncdu  # Disk usage analyzer

brew install pstree  # Display process tree

brew install fzf  # Fuzzy finder

brew install bat  # Cat clone with syntax highlighting

brew install exa  # Modern replacement for ls

brew install ripgrep  # Line-oriented search tool

brew install httpie  # HTTP client

brew install telnet  # Telnet client

brew install mtr  # Network diagnostic tool

brew install iftop  # Network bandwidth monitoring

brew install iperf  # Network performance measurement

brew install packer  # Create machine images

brew install packeth  # Network traffic generator

brew install openvpn  # VPN client

brew install openconnect  # VPN client

brew install rclone  # Cloud storage sync

brew install lastpass-cli  # LastPass command-line interface

brew install gpg-suite  # GPG tools

brew install yubikey-agent  # YubiKey management
 
brew install --cask balenaetcher
brew install --cask beyond-compare
brew install --cask binance
brew install --cask clamxav
brew install --cask copilot-for-xcode
brew install --cask curiosity
brew install --cask effect-house
brew install --cask feed-the-beast
brew install --cask grammarly
brew install --cask ghidra
brew install --cask home-assistant
brew install --cask league-displays
brew install --cask lightworks
brew install --cask maccy
brew install --cask metasploit
brew install --cask minecraft
brew install --cask mysqlworkbench
brew install --cask nosql-workbench
brew install --cask developerexcuses
brew install --cask obsidian
brew install --cask openemu
brew install --cask openrgb
brew install --cask openshift-client
brew install --cask opentoonz
brew install --cask orbstack
brew install --cask orca
brew install --cask pgadmin4
brew install --cask poe
brew install --cask pokerstars
brew install --cask postgres-unofficial
brew install --cask postgrespreferencepane
brew install --cask pretzel
brew install --cask pomotroid
brew install --cask prusaslicer
brew install --cask qdslrdashboard
brew install --cask rancher
brew install --cask react-studio
brew install --cask react-proto
brew install --cask reactotron
brew install --cask rectangle
brew install --cask red-canary-mac-monitor
brew install --cask repetier-host
brew install --cask rhino
brew install --cask razorsql
brew install --cask sequel-ace
brew install --cask serene
brew install --cask securid
brew install --cask sidequest
brew install --cask sleek
brew install --cask snapmaker-luban
brew install --cask snapmotion
brew install --cask soapui
brew install --cask sonic-pi
brew install --cask sigmaos
brew install --cask telegram-desktop
brew install --cask todoist
brew install --cask tor-browser
brew install --cask transmission
brew install --cask ultimaker-cura
brew install --cask unity
brew install --cask unity-hub
brew install --cask tableau
brew install --cask wine-stable
brew install --cask zsa-wally