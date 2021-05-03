# fedora_container Docker image for Linux
This is a Docker image that uses Fedora (34) and adds a user (with sudo privileges) to the installation. Applications that use a GUI are redirected to the host display.

The installed programs can be found in the Dockerfile. Use the build_fedora_container.sh script to build the Docker image.

# Usage
```bash
# build the docker image
bash ./build_fedora_container
# stop container
bash ./stop_fedora_container
# run container
bash ./run_fedora_container
# start interactive container
bash ./start_interactive_fedora_container
# start container
bash ./start_fedora_container
# open (connect to) shell session of running container
bash ./connect_fedora_container
# clean container files
bash ./cleanup_fedora_container
```

Add lab folder as a remote to another git repo by:
```bash
git remote add origin https://github.com/USER/REPO.git
git remote -v
git push origin main # or other branch
```

# Install lab repo after build
```bash
cd /home/user
git clone https://github.com/lennertfranssens/containers.git
bash ./setup_bsys2_lab.sh
```
