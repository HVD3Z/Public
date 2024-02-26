#!/bin/bash
# Install essential tools via Homebrew
brew update
# Install Visual Studio Code (VSCode)
brew install --cask visual-studio-code
# Install Docker
brew install --cask docker
# Install Jenkins (CI/CD automation server)
brew install jenkins
# Install Terraform (infrastructure as code)
brew install terraform
# Install Ansible (configuration management)
brew install ansible
# Install SonarQube (static code analysis)
brew install sonarqube
# Install OWASP ZAP (web application security scanner)
brew install owasp-zap
# Install Trivy (container image vulnerability scanner)
brew install trivy
# Install Kali Linux (for penetration testing)
brew install --cask kali-linux
# Install Wireshark (network protocol analyzer)
brew install --cask wireshark
# Install Vault (secrets management)
brew install vault
# Install GitLab Runner (for GitLab CI/CD)
brew install gitlab-runner
# Install AWS CLI (Amazon Web Services command-line interface)
brew install awscli
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
# Install HashiCorp Vault (secrets management)
brew install vault
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
# Clean up Homebrew
brew cleanup
echo "DevSecOps workstation setup completed! 🛡️"