#!/bin/bash

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

nvm install 20

nvm use 20

npm install -g create-react-app

nvm use 20

npm start --prefix /app

