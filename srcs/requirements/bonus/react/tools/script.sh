#!/bin/bash

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

git config --global credential.helper cache

git clone https://github.com/BredyByte/myProjectsApp.git /app

nvm install 20

nvm use 20

npm install --prefix /app

nvm use 20

npm start --prefix /app

