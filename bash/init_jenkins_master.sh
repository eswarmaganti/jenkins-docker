#! /bin/bash

# update the apt package manager
yes | sudo apt-get update

# install python3 using apt package manager
yes | sudo apt install python3

# install java and jdk using apt package manager
yes | sudo apt install default-jre
yes | sudo apt install default-jdk


# install jenkins keyring public key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
# install jenkins server
sudo apt-get install jenkins
