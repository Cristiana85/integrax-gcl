FROM node:latest AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:stable
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/ /usr/share/nginx/html
EXPOSE 8080
# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]