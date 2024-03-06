
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY /src/app/dist/integrax-frontend-gcl /usr/share/nginx/html