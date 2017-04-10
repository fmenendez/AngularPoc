FROM node:latest

# prepare a user which runs everything locally! - required in child images!
ENV HOME /project
WORKDIR /project

ENV APP_NAME=angularpoc

# before switching to user we need to set permission properly
# copy all files, except the ignored files from .dockerignore
COPY . $HOME/$APP_NAME/

WORKDIR $HOME/$APP_NAME

EXPOSE 9000

RUN set -ex;\
    apt-get update && apt-get install -y ruby-compass; \
    npm install -g grunt-cli bower;

CMD ["grunt", "serve"]