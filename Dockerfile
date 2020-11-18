FROM node:alpine

RUN mkdir -p /usr/src/app
# Production use
# RUN mkdir /home/node/app/ && chown -R node:node /home/node/app
ENV PORT 3000
# Add more environment variables here

WORKDIR /usr/src/app
# Production use
# WORKDIR /home/node/app

COPY package.json /usr/src/app
COPY yarn.lock /usr/src/app
# Production use
# COPY --chown=node:node package*.json ./

# Production use node instead of root
# USER node

RUN yarn install --production

COPY . /usr/src/app
# Production use
# COPY --chown=node:node index.js .
# COPY --chown=node:node lib ./lib/

RUN yarn build

EXPOSE 3000
CMD [ "yarn", "start" ]