# Stage 1
FROM node:latest as build
WORKDIR /src
COPY . ./
RUN npm install
RUN npm run build
RUN npm install -g serve
CMD serve -s build

# Stage 2 - the production environment
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build src/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]