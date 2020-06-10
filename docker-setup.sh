
# Update system packages
sudo apt-get update -y
sudo apt-get upgrade -y


# install required packages
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y


# Download repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# Added docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


# updated packages if any.
sudo apt-get update -y


# Finally, install Docker ce
sudo apt-get install docker-ce docker-ce-cli containerd.io -y



#* Configure Docker to start on boot
sudo systemctl enable docker


# Installation docker-compose
sudo apt-get install docker-compose -y


#* Post Installation [The `docker` group grants privileges equivalent to the `root`]
#  So, `sudo prefix` will be not required everytimes.
sudo groupadd docker
#sudo usermod -aG $USER root
sudo usermod -aG docker $USER
newgrp docker 						# activate the changes to `docker` groups



#sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker




# ------------------------------------------------------------------
# Uninstall the Docker Engine - Community package:
# sudo apt-get purge docker-ce