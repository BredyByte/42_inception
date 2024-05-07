#!/bin/bash

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

git config --global credential.helper cache

if [ -z "$(ls -A /app)" ]; then
    git clone https://github.com/BredyByte/myProjectsApp.git /app
else
    echo "Directory /app is not empty, skipping git clone"
fi

nvm install 20

nvm use 20

npm install --prefix /app

sleep 5

nvm use 20

npm start --prefix /app

