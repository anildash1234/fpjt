FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . ./app
CMD ["node", "index.js"]
