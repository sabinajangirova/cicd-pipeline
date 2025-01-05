FROM node:10
WORKDIR /opt
ADD . /opt
RUN npm install
ENTRYPOINT npm run start
