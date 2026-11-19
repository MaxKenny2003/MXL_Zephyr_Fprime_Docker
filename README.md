## What is this? 
This is a Docker container that has all of the libraries and SDKs required to use Zephyr and F Prime.

If you are curious as to what a docker is, think of it like a virtual environment, but for whole system code. In python virtual environments, you can have specific versions of python libraries. In a docker container, you can have your own version of software development kits or even operating systems. For example, this docker uses Ubuntu 24.04 while the newest version of the Zephyr SDK installed by default. I created it so that you (the user) do not need to download all of the software to develop or build a zephyr program.

## How do I use this? 

First make sure that you have docker and docker-compose:

```
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER
```

Clone the repo using:

```
git clone https://github.com/MaxKenny2003/MXL_Zephyr_Fprime_Docker.git
```

Once you have the code, in the directory that it creates, ensure that the custom shell script has all of the permissions that it needs: 

```
chmod +x run_docker.sh
```

Once you have this, start the docker container by running the shell script: 

```
./run_docker.sh
```

This will start you in `/root/zephyrproject` which is exactly where you want to be to build zephyr projects. 

## Notes and things YOU should know
- To exit a docker container, just type `exit` in the terminal.

- When you exit a docker container it stays on your disk. Please note that if you are running WSL, it will allocate space in your partition for it. If you have to many exited docker containers it will nuke your storage. Periodically run `docker container prune` to clear any containers that are running. 