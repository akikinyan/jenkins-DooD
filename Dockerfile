FROM jenkins/jenkins:lts

USER root
RUN apt-get update \
    && apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg \
     | apt-key add - \
    && add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) \
     stable" \
    && apt-get update \
    && apt-get install -y docker-ce \
    && usermod -aG docker jenkins

RUN curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

USER jenkins
