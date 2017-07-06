FROM node:alpine

RUN mkdir -p /usr/src/app

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules /usr/src/app

WORKDIR /usr/src/app  
COPY . /usr/src/app

EXPOSE 8081  
RUN npm install  
CMD ["npm", "start"] 