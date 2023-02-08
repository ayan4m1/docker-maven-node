FROM maven:3.8-openjdk-18

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 15.5.1

RUN mkdir $NVM_DIR

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN microdnf install curl vim git

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g gulp-cli

CMD [ "/bin/bash" ]
