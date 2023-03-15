ARG MVN_VERSION
ARG JDK_VERSION
ARG NODE_VERSION

FROM maven:${MVN_VERSION}-openjdk-${JDK_VERSION}

LABEL org.opencontainers.image.source=https://github.com/ayan4m1/docker-maven-node
LABEL org.opencontainers.image.description="Maven/Node.JS"
LABEL org.opencontainers.image.licenses=MIT

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION ${NODE_VERSION}

RUN mkdir $NVM_DIR

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN microdnf install curl git

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

CMD [ "/bin/bash" ]
