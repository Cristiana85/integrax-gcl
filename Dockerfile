FROM node:latest AS build

RUN mkdir -p /src/app/

WORKDIR /src/app
ENV PATH /src/app/node_modules/.bin:$PATH

COPY package.json /src/app/

RUN npm install
RUN npm install react-scripts -g

ADD src /src/app/src
ADD public /src/app/public

COPY . /src/app
RUN npm run build

FROM nginx:1.13.12-alpine
COPY --from=build /src/app/build /share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]`