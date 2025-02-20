FROM ubuntu:22.04

ARG USER
ARG USER_ID
ARG GROUP_ID

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    watchman 
       
    
RUN curl -sL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get install -y nodejs 

RUN npm install -g npm@11.1.0

    
RUN groupadd -g ${GROUP_ID} docker && \
    useradd -u 1000 -m -g docker ${USER}

RUN chown -R ${USER}:docker /home/${USER}
RUN chmod -R 777 /home/${USER} && \
    mkdir /home/${USER}/app && \
    chown -R ${USER}:docker /home/${USER}/app

EXPOSE 3000

USER ${USER}

WORKDIR /home/${USER}/app

ENV INIT_CWD=/home/${USER}/app

CMD [ "tail", "-f", "/dev/null"]