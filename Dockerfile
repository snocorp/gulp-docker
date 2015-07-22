#
# Gulp docker image
#
# http://github.com/snocorp/gulp-docker
#

FROM node:latest

RUN npm install -g gulp

WORKDIR /usr/src/web

# Copy the rest of the application into place.
ONBUILD ADD . /usr/src/web

# Build the static website.
ONBUILD RUN gulp

# Dump out the git revision.
ONBUILD RUN \
  mkdir -p ./.git/objects && \
  echo "$(git rev-parse HEAD)" > ./REVISION && \
  rm -rf ./.git
