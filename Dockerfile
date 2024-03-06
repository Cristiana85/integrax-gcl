# 1. Build our Angular app
FROM node:12 as builder

WORKDIR /app
COPY package.json package-lock.json ./

COPY . .
RUN npm run build-web --output-path=/dist
RUN ls

# 2. Deploy our Angular app to NGINX
FROM nginx:alpine

## Replace the default nginx index page with our Angular app
RUN rm -rf /usr/share/nginx/html/* 
COPY --from=builder /app/dist /usr/share/nginx/html

COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]