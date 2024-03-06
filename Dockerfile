FROM node:latest AS builder
COPY . ./src/app
WORKDIR /src/app
RUN npm i
RUN ng build --prod
FROM nginx:1.15.8-alpine
COPY --from=builder /dist/integrax-frontend-gcl/ /usr/share/nginx/html