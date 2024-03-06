FROM node:latest AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:stable
COPY --from=build /app/dist/integrax-frontend-gcl/ /usr/share/nginx/html
EXPOSE 8080