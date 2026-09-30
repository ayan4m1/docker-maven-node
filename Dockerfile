ARG MVN_VERSION
ARG JDK_VERSION

FROM maven:${MVN_VERSION}-eclipse-temurin-${JDK_VERSION}

ARG NODE_VERSION
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION=${NODE_VERSION}

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y curl git bash

WORKDIR $NVM_DIR

SHELL [ "bash", "-c" ]

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

CMD [ "/bin/bash" ]
