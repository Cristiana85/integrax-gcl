FROM node:12.7-alpine AS build
WORKDIR /src/app
COPY package.json /src/app/
RUN npm install
COPY . .
RUN npm run build

