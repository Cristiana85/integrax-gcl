# Let's use a node image based on alpine
# Alpine is a lightweight Linux distribution, that's why
FROM node:alpine
# Copy all the code present here to the docker
COPY . /src
# Change working directory to code_app
WORKDIR /src
# Run the following commands
RUN npm install
RUN npm run build
RUN npm install -g serve
CMD serve -s build

#FROM nginx:1.17.1-alpine
#COPY nginx.conf /etc/nginx/nginx.conf
#COPY /src/app/dist/aston-villa-app /usr/share/nginx/html