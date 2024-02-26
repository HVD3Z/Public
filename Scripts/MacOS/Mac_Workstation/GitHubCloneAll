### Github CLI Init

`gh auth login`

### Github CLI Cloning Script _**~$ORG = repository organization space~**_

`gh repo list $ORG --limit 1000 | while read -r repo _; do gh repo clone "$repo" "$repo"; done`

### Github CLI update all org repos checkouts *~have not tested~*

`gh repo list $ORG --limit 1000 | while read -r repo_; do gh repo clone "$repo" "$repo" -- -q 2>/dev/null || ( cd "$repo" git checkout -q main 2>/dev/null || true git checkout -q master 2>/dev/null || true git pull -q ) ; done`