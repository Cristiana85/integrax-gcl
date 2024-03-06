FROM node:latest AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Setup ###
FROM nginx
## Copy our default nginx config
COPY nginx/default.conf /etc/nginx/conf.d/
## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /app/dist/integrax-frontend-gcl /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]

#FROM nginx:stable
#RUN rm /etc/nginx/conf.d/default.conf
#COPY --from=build /app/dist/integrax-frontend-gcl /usr/share/nginx/html
#COPY --from=build /nginx.conf /etc/nginx/conf.d/default.conf
