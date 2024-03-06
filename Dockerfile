FROM node:13.3.0 AS compile-image    
COPY package.json package-lock.json ./    
RUN npm install && mkdir /integrax-frontend-gcl
ENV PATH="./node_modules/.bin:$PATH"
WORKDIR /integrax-frontend-gcl
COPY . .
RUN ng build --prod
FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY --from=compile-image /integrax-frontend-gcl/dist /usr/share/nginx/html