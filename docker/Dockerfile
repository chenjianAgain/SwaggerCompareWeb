FROM node:latest

# Create app directory
RUN mkdir -p /usr/src/scw
WORKDIR /usr/src/scw

# Install app dependencies
COPY ../package.json ../package-lock.json ./

# run NPM install
RUN npm install

# Bundle app source
COPY ../ .

# Port for Web
EXPOSE 8088

# How to start the app
CMD [ "npm", "start" ]