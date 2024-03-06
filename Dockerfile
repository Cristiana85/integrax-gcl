# Stage 1
FROM node:latest as node
WORKDIR /app 
COPY . .
RUN npm install
RUN npm run build  --prod
# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist/integrax-frontend-gcl /usr/share/nginx/html
