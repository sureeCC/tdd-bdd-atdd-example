FROM node:lts-alpine
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
RUN npm install --save-dev @babel/core @babel/cli
RUN npm install -g @babel/node
COPY . .
EXPOSE 1337
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
