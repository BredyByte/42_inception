# Inception

> This repository contains a "Inception" project that is part of the École 42 curriculum.

## Guidelines
- Add domain $USER.42.fr to lokalhost in /etc/hosts file
- Create /home/$USER/data folder with nginx content: html/index.html, css/styles.css cerf/server.key and cerf/server.key.
- To generate server certificate and key firstly install openssl with apt or other package manager and execute the following comman:
  ```bash
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
  ```
  this command will ask you some questions and generate key depends on your answers.

- to check if redis is working properly execute the following command:
  ```bash
  redis-cli ping
  ```
  if it returns PONG then everything is working properly.
  or you can check it with the following command:
  ```bash
  apt-get install net-tools && netstat -tuln | grep 6379
  ```
  or other one:
  ```bash
  > redis-cli
  > SET some "HOLA PAYASOS!!"
  > GET some
  ```
  should return "HOLA PAYASOS!!"

