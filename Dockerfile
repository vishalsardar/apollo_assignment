FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

# copy remaining files
COPY . ./

CMD [ "npm", "start"]
