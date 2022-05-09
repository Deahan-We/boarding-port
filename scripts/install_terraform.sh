#!/bin/bash

echo "Installing tfenv for setting dev environment"
OS=$(uname -a)

if ! tfenv -v  > /dev/null; then
        echo "Installing tfenv.."

        if [[ "$OS" == *"Ubuntu"* ]]; then
		sudo apt-get update
		sudo apt-get install -y unzip
        	git clone https://github.com/tfutils/tfenv.git ~/.tfenv
		export PATH="$HOME/.tfenv/bin:$PATH"
        	echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
        elif [[ "$OS" == *"Darwin"* ]]; then
                brew install tfenv
		brew install unzip
        else
                echo "There is no os support for this repo"
                exit 1;
        fi
fi

TERRAFORM_VERSION=$(cat ../tf/.terraform-version)
tfenv install $TERRAFORM_VERSION
tfenv use $TERRAFORM_VERSION

