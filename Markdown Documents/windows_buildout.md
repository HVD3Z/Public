# Windows script for buildout  
This contains all of the vital workflow tools and extensions that I require  
## Apps to install

[VS Code](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user)

[Docker Desktop](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)

[GitHub CLI](https://github.com/cli/cli/releases/download/v2.14.4/gh_2.14.4_windows_amd64.msi)

[Puppet Development Kit (PDK)](https://pm.puppet.com/cgi-bin/pdk_download.cgi?dist=win&arch=x64&ver=latest)

[Oh My ZSH](https://www.maketecheasier.com/install-zsh-and-oh-my-zsh-windows10/#:~:text=Using%20Zsh%20on%20Windows%2010%20Using%20zsh%20on,returned%20to%20the%20zsh%20command%20prompt.%20See%20More.)

[GoLang](https://go.dev/dl/go1.19.windows-amd64.msi)

## Clone down all repos

#### Github CLI Init  
`gh auth login`

#### Github CLI Cloning Script _**~$ORG = repository organization space~**_  
`gh repo list $ORG --limit 1000 | while read -r repo _; do gh repo clone "$repo" "$repo"; done`

#### Github CLI update all org repos checkouts *~have not tested~*  
`gh repo list $ORG --limit 1000 | while read -r repo_; do gh repo clone "$repo" "$repo" -- -q 2>/dev/null || ( cd "$repo" git checkout -q main 2>/dev/null || true git checkout -q master 2>/dev/null || true git pull -q ) ; done`

## VS Code Extensions
 - VS Code Sequence Diagrams &nbsp;&nbsp;&nbsp;&nbsp;* GoLang
 - GitLens &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Remote SSH
 - Markdown All in One &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Remote SSH: Editing Configuration Files
 - markdownlint &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Remote Containers
 - opensslutils &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Remote Development
 - regex previewer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Docker
 - x509 parser &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Docker Linter
 - Python &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Docker Compose
 - Puppet &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* AWS Toolkit
