# selecting the base ubuntu image for docker agent
FROM ubuntu:22.04

# update the package manager and install the dependencies
RUN yes | apt-get update
RUN yes | apt install git python3 default-jdk default-jre openssh-server curl ca-certificates

# install docker keyrings
RUN yes | install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# adding the repository source to apt package manager
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN yes | apt-get update
# installing the docker 
RUN yes | apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


RUN mkdir -p /var/run/sshd

# installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN yes | apt install nodejs

# installing maven



# add a jenkins user with password
RUN adduser --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd


RUN mkdir /home/jenkins/.ssh && chown -R jenkins:jenkins /home/jenkins/.ssh 

# copy the public key of jenkins server
RUN echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL+hOoZbvvZSI8FfF+JXrAgMmz2O7myFBnjIAxnJGQXu Jenkins" > /home/jenkins/.ssh/authorized_keys

RUN service ssh start

# exposing port 22 for ssh to container from jenkins server
EXPOSE 22

# run the openssh server
CMD [ "/usr/sbin/sshd","-D" ]
