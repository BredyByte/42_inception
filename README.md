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

- <details>
  <summary> <b>Bonus Part</b>: </summary>
  <ul>
    <li>
      Set up <b> redis cache </b>for your WordPress website in order to properly manage the cache. - ✅
    </li>
    <li>
      Set up a <b>FTP server</b> container pointing to the volume of your WordPress website. - ❌
    </li>
    <li>
      Create a simple <b>static website</b> in the language of your choice except
      PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume. - ✅
    </li>
    <li>
      Set up <b>Adminer</b>. Adminer is a database management tool that allows you to manage your databases easily. - ✅
    </li>
    <li>
      Set up a service of your choice that you think is useful. During the
      defense, you will have to justify your choice. - ❌
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
- to check if redis is working properly execute the following command. If it returns PONG then everything is working properly:
  ```bash
  redis-cli ping
  ```

  Other way to check it with the following command, should indicate that port 6379 is open:
  ```bash
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install net-tools
  netstat -tuln | grep 6379
  ```
  Other way to check it with the following command, should return "HOLA PAYASOS!!"
  ```bash
  > redis-cli
  > SET some "HOLA PAYASOS!!"
  > GET some
  ```

## 🙋 Usage:

### Building:
1. Clone the repository:
2. Navigate to the project directory:
3. Run: ```make``` to complie the project. This command will:
* Create a network "webnet".
* Volumes: "nginx", "maria", "react" in /home/$USER/data folder.
* Build the Docker images for Nginx, WordPress, MariaDB, Redis, Adminer, and Static Website.
* Create and run the Docker containers for the services.

### Commands:
1. Run: ```make stop``` to stop the services.
2. Run: ```make down``` to stop and remove the containers.
3. Run: ```make fclean``` to stop, remove the containers, remove the images, remove the volumes, and remove the network.
4. Run: ```make re``` to re-run the project. Is like running ```make fclean``` and then ```make```.
5. Run ```docker system prune --force --all``` to delete all the images, containers, and cache of docker.

### Ports:
- **443: HTTPS** is open for the domain $USER.42.fr - and shows the WordPress website. Wp-admin is also accessible with the dbredykh login and dbredykhpass password. The additional user is payaso with the payasopass password.
- **7070: HTTP** is open for one of the additional services. The service is a static website that shows the resume of the author.
- **8080: HTTP** is open for the Adminer service. The service is accessible with the dbredykh login, dbredykhpass password, database name is wordpress and the hostname is mymariadb.
- **6379: TCP** is open for the Redis service.

