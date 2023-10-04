## Catalyst Docker Image for Development
### Introduction
For testing and development purposes, we have created a Docker image with the latest version of Catalyst pre-installed. Running Catalyst in a Docker container offers two main advantages:

1) Portability: The container can be easily shared and deployed across different systems.
2) Quick Setup: Eliminates the time-consuming process of manually installing Catalyst and its dependencies.

## Update:
Added the docker file so all one has to do is pull the repo and run:
```bash
$ docker-compose up --build
```
>Also, added volumes to the container so ann app created will persist. Once the container is built and running, enter the containers terminal and run:
 ```bash
 $ catalyst.pl <app-name>
 $ cd <YOUR APP NAME>
 $ script/yourappname_server.pl -r
 ```

You should now have a running server on localhost:3000/

- Ensure docker and docker-compose are installed.
- pull the image from docker hub
 ```bash
docker pull ababcock01/catalyst-5.9:latest
```
- Create the docker-compose.yml file and add the following:
 ```yml
version: '3'
services:
  web:
    image: ababcock01/catalyst-5.9:latest
    platform: linux/amd64
    command: /bin/bash
    stdin_open: true
    tty: true
    ports:
      - "3000:3000"
 ```
- Next run docker-compose in detach mode
```bash
   docker compose up -d --build
   ```
- Check that the container is running with the command: 
```bash
  docker ps
  ```
- You should see: 
```bash
  CONTAINER ID   IMAGE                            COMMAND       CREATED          STATUS          PORTS                    NAMES
  5488ad33abf0   ababcock01/catalyst-5.9:latest   "/bin/bash"   24 minutes ago   Up 24 minutes   0.0.0.0:3000->3000/tcp catalystapp-web-1
  ```
- Check the container name and run: 
``` bash
  docker exec -it  catalystapp-web-1 /bin/bash
  ```
- You should see the prompt for your running container:
```
  root@5488ad33abf0:/usr/src/app# 
  ```
- inside the app directory you should be able to create a new Catalyst app using:
```bash
root@5488ad33abf0:/usr/src/app# catalyst.pl MyApp
```

- cd into the newly created directory and run:
```bash
root@5488ad33abf0:/usr/src/app/MyApp# script/myapp_server.pl -r
  ```
- The -r command allows for hot reloads. If everything is correct you should be able to navigate to ```localhost:3000/``` and will be see the Catalyst welcome page
