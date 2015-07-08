#
# Gulp docker image
#
# http://github.com/snocorp/gulp-docker
#

FROM node:latest

RUN npm install -g gulp

WORKDIR /usr/src/web

