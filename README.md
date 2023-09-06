# HZBooK Simple Django App For Managing Books

## Contents Guide
+ [Prerequisites?](#Prerequisites)
    + [Shell Environment and Editor](#Shell)
    + [Installing Kubernetes](#Kubernetes)


## Prerequisites

Excercise will require the tooling listed below. Ensure that all of those tools have been installed before attending the training if you want to following along. The training does not reserve time for setting up or verifying the installed tools or their respective versions.

## Kubernetes

Attendees will need access to a Kubernetes cluster, either local or remote. Align the version of Kubernetes with version used during the exam. The recommended setup for this course is to install [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/). Minikube comes with a pre-installed Docker daemon.

Alternatively, you may also go with [Docker Desktop](https://www.docker.com/products/docker-desktop) which is available for Mac and Windows. Docker Desktop provides an option to start a fully functional Kubernetes environment.

## Shell

The certification exam uses "Bourne Again shell" (bash) as the shell environment. Bash needs to be available on your development environment. You can check your shell by running the command `echo $0`.

This course is going to use `vim` as the editor for text files. Install the editor on your development environment. You may opt for other editors. Some test takers prefer `nano` as an alternative to `vim`.

install azure cli
brew update && brew install azure-cli

az config set core.allow_broker=true
az account clear
az login

az login -u <username> -p <password>

```bash
//azure cli login
az login -u <username> -p <password>
az aks create -g rg-hzbook -n hzbook --enable-managed-identity --node-count 1 --generate-ssh-keys
```