## Catalyst Docker Image for Development
### Introduction
For testing and development purposes, we have created a Docker image with the latest version of Catalyst pre-installed. Running Catalyst in a Docker container offers two main advantages:

1) Portability: The container can be easily shared and deployed across different systems.
2) Quick Setup: Eliminates the time-consuming process of manually installing Catalyst and its dependencies.

## Update:
Added the docker file so all one has to do is pull the repo and run:
>Insure docker and docker-compose are installed

```bash
$ docker-compose up -d --build
```
One the container is running in detach mode run docker ps command to check the container name and then run:
```bash
$ docker exec -it <container-name> /bin/bash
```
You should now have a terminal instance for you container. To create a new Catalyst app, follow these commands in you containers terminal:

 ```bash
 $ catalyst.pl <app-name>
 $ cd <YOUR APP NAME>
 $ script/yourappname_server.pl -r
 ```
You should now have a running server on localhost:3000/

To stop the container, you can open another terminal window and run:
```bash
$ docker-compose down
```
To continue working in your container run:
```bash
$ docker-compose up -d
```
