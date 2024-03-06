# Let's use a node image based on alpine
# Alpine is a lightweight Linux distribution, that's why
FROM node:alpine
# Copy all the code present here to the docker
COPY . /app
# Change working directory to app
WORKDIR /app
# Run the following commands
RUN npm install
RUN npm run build --prod
#RUN npm install -g serve
#CMD serve -s build