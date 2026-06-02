FROM node:20
WORKDIR /opt/server
COPY package*.json .
COPY *.js .
RUN ["npm", "install"]
ENV REDIS_HOST=<REDIS-SERVER-IP> \
    CATALOGUE_HOST=<CATALOGUE-SERVER-IP> \
    CATALOGUE_PORT=8080
EXPOSE 8080
CMD ["node", "server.js"]