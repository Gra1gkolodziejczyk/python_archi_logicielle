#!/bin/bash
set -e

ENV=$1

# Cur dir relative to root
CUR_DIR=".devcontainer"


#* ZSH *#
# If the env is not equal to devcontainer then ask the use for the zsh installation
if [ "$ENV" != "devcontainer" ]; then
    echo "🚀 Do you want to configure ZSH? (y/n)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        $CUR_DIR/configure-zsh.sh 1>/dev/null 2>&1
    fi
else
    $CUR_DIR/configure-zsh.sh 1>/dev/null 2>&1
fi

# Install pyenv
echo "🚀 Installing pyenv..."
curl https://pyenv.run | bash
#? Reload shell
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.12-dev
pyenv virtualenv 3.12-dev dev
pyenv activate dev

#* Install *#
echo "🚀 Installing dependencies..."
pip3 install -r requirements.txt

echo "🎉 Installing done!"
