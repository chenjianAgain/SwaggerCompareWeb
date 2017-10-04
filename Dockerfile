FROM node:latest

LABEL Author="Stuart Williams <spookdejur@hotmail.com>"

# Create app directory
RUN mkdir -p /usr/src/scw
WORKDIR /usr/src/scw

# Install app dependencies
COPY package.json package-lock.json ./

# run NPM install
RUN npm install

# Bundle app source
COPY . .

# Port for Web
EXPOSE 8033

# How to start the app
CMD [ "npm", "start" ]