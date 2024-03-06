# Stage 1
#FROM node:latest as node
#WORKDIR /app
#COPY . .
#RUN npm install
#RUN npm run build  --prod
# Stage 2
#FROM nginx:alpine
#COPY --from=node /app/dist/integrax-frontend-gcl /usr/share/nginx/html


# Let's use a node image based on alpine
# Alpine is a lightweight Linux distribution, that's why
FROM node:alpine
# Copy all the code present here to the docker
COPY . /
# Change working directory to src
WORKDIR /app
# Run the following commands
RUN npm install
RUN npm run build --prod
#RUN npm install -g serve
#CMD serve -s build