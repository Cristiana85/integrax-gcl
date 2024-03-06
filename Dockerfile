FROM node:12.0.0-alpine AS builder
COPY . ./integrax-frontend-gcl
WORKDIR /integrax-frontend-gcl
RUN npm i
RUN ng build --prod
FROM nginx:1.15.8-alpine
COPY --from=builder /integrax-frontend-gcl/dist/angular-docker/ /usr/share/nginx/html