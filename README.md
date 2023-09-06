install azure cli
brew update && brew install azure-cli

az config set core.allow_broker=true
az account clear
az login

az login -u <username> -p <password>
