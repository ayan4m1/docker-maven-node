ARG MVN_VERSION
ARG JDK_VERSION

FROM maven:${MVN_VERSION}-eclipse-temurin-${JDK_VERSION}

ARG NODE_VERSION
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION ${NODE_VERSION}

RUN mkdir $NVM_DIR

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

RUN apt-get install curl git

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

CMD [ "/bin/bash" ]
