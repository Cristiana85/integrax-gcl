# Let's use a node image based on alpine
# Alpine is a lightweight Linux distribution, that's why
#FROM node:alpine
FROM node:latest as node
# Copy all the code present here to the docker
WORKDIR /app
COPY . .
# Run the following commands
RUN npm install
RUN npm run build --prod
#RUN npm install -g serve
#CMD serve -s build
# Stage 2
#FROM nginx:alpine
#COPY --from=node /app/dist/integrax-frontend-gcl /usr/share/nginx/html