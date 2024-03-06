FROM node AS build
WORKDIR /usr/src/app
...
RUN ng build --configuration=production

FROM nginx
COPY nginx/staging-default.conf /etc/nginx/conf.d/default.conf
COPY --from=build ./usr/src/app/dist/integrax-frontend-gcl /usr/share/nginx/html/