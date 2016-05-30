## Intro

*This image is pushed to the docker hub as bobbykostadinov/nginx_node6*

This package creates:

1. Ubuntu Server using phusion/baseimage;

2. Install all needed packages, including compiling python 2.7 needed for npm

3. Nginx - sets up nginx as proxy on port 8888;

4. Nodejs - Install default package for node 6

6. Runs npm install and gulp build (part of my project - could be removed)

7. Start nginx and run npm start


## Docker instructions


Create a new Boot2Docker VM.

    $ boot2docker init

This creates a new virtual machine. You only need to run this command once.

To check the running virtual machine use

    docker-machine

More information and help is available in the terminal. here you can find the IP your machine was assigned

Display available images

    docker images

Display your running container with

    docker ps

Build a new container wiht

    docker build -t TAGHERE .

To start an image with command line and port mapping:

    docker run -d -p 80:80 TAGHERE /bin/bash

To manage repository stored in Docker Hub https://docs.docker.com/mac/step_six/


## License

[MIT](/LICENSE)
