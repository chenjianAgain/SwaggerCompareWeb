############################################################
# Dockerfile to build Swagger Compare Node Application 
# container image, based on node image
############################################################
FROM node:latest

LABEL Author="Stuart Williams <spookdejur@hotmail.com>"

ENV PORT 80
ENV WDIR /usr/src/scw
# Create app directory
RUN mkdir -p ${WDIR}
WORKDIR ${WDIR}

# Bundle app source
COPY . .

# run NPM install
RUN npm install

# Verify files are there
RUN find ${WDIR} -type f  -follow -print | grep -v ./node_modules

# Port for Web
EXPOSE ${PORT}

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:${PORT} || exit 1

# How to start the app
CMD [ "npm", "start" ]