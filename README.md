# ⏳ Inception

> This repository contains a "Inception" project that is part of the École 42 curriculum.

## 🧐 Overview:
The aims is provide hands-on experience with virtualization and creating custom Docker images using various services. The project involves setting up a server with Nginx, a MariaDB SQL database, and a WordPress website. Notably, the challenge lies in creating Docker images without relying on Docker Hub, necessitating the use of base images from Debian or Alpine of last stable version.

## 📘 Subject:
The project subject revolves around mastering the following key objectives:

- **Virtualization Skills**: Gain proficiency in virtualization technologies, including Docker, by setting up and managing containers for different services.
- **Custom Image Creation**: Learn how to create custom Docker images tailored to specific project requirements using base images from Debian, Alpine.
- **Service Configuration**: Configure Nginx as a web server, MariaDB as a SQL database server, and WordPress as a content management system (CMS), ensuring seamless interaction between these services.
- **Security and Optimization**: Implement security measures and optimize the performance of the deployed services to enhance reliability and efficiency.
- <details>
  <summary> <b>Mandatory Part</b>: </summary>
  <ul>
    <li>
      A Docker container that contains <b>NGINX</b> with TLSv1.2 or TLSv1.3 only.
    </li>
    <li>
      A Docker container that contains <b>WordPress</b> + php-fpm (it must be installed and configured) only without nginx.
    </li>
    <li>
      A volume that contains your <b>WordPress</b> database.
    </li>
    <li>
      A second volume that contains your <b>WordPress</b> website files.
    </li>
    <li>
      A docker-network that establishes the connection between your containers.
    </li>
  </ul>
</details>

## 🦮 Guidelines:

### Crete shared folder for your virtualBox
1.  Execute the following command inside your virtual machine:
```bash
sudo apt update && sudo apt upgrade
sudo apt install build-essential dkms linux-headers-$(uname -r)
```
2. Configure access to shared folders:
  - In VirtualBox, select your Debian virtual machine and click on "Settings".
  - Go to the "Shared Folders" tab.
  - Click the plus (+) sign icon in the right corner to add a new shared folder.
  - Select the folder you want to share from your macOS system.
  - Check the "Auto Mount" and "Permanent" options if you want the shared folder to be available automatically when starting the virtual machine.
3. Mount the shared folder in Debian:
- Restart your Debian virtual machine.
- Open a terminal and create a directory where you want to mount the shared folder. For example:
```bash
sudo mkdir /mnt/shared
```
- Mount the shared folder using the following command:
```bash
sudo mount -t vboxsf filename /mnt/shared
```
(Replace "share_folder_name" with the name of the shared folder you set up in VirtualBox.)

### Add sudo rights to $USER
1. execute the following command:
```bash
su -
apt-get install sudo
/sbin/adduser $USER sudo
sudo echo "HELLO WORLD"
```

### Install Docker
1. execute the following command:
```bash
  sudo apt-get update && sudo apt-get upgrade
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh ./get-docker.sh
```
2. Add your user to the docker group:
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```

### Add $USER.42.fr DomainName
1. execute the following command:
```bash
sudo chmod 777 /etc/hosts
```
2. Inside /etc/hosts file , add the following line:
```bash
127.0.0.1       $USER.42.fr
```

### Check redis is mounted properly
- to check if redis is working properly execute the following command:
  ```bash
  redis-cli ping
  ```
  If it returns PONG then everything is working properly.
  Other way to check it with the following command:
  ```bash
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install net-tools
  netstat -tuln | grep 6379
  ```
  Other way to check it with the following command:
  ```bash
  > redis-cli
  > SET some "HOLA PAYASOS!!"
  > GET some
  ```
  should return "HOLA PAYASOS!!"

