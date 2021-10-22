# building_container Docker image for Linux
This is a Docker image that uses Ubuntu (20.04 LTS) and adds a user (with sudo privileges) to the installation. Applications that use a GUI are redirected to the host display.

The installed programs can be found in the Dockerfile. Use the build_building_container.sh script to build the Docker image.

# Usage
```bash
# build the docker image
bash ./build_building_container.sh
# stop container
bash ./stop_building_container.sh
# run container
bash ./run_building_container.sh
# start interactive container
bash ./start_interactive_building_container.sh
# start container
bash ./start_building_container.sh
# open (connect to) shell session of running container
bash ./connect_building_container.sh
# clean container files
bash ./cleanup_building_container.sh
```

### Useful commands
[Visit this website.](https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/)
