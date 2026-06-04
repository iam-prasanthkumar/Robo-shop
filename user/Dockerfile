FROM node:20
WORKDIR /opt/server
COPY package*.json .
COPY *.js .
RUN ["npm", "install"]
ENV MONGO=true \
    REDIS_URL='redis://redis:6379' \
    MONGO_URL="mongodb://mongo:27017/users"
EXPOSE 8080
CMD ["node", "server.js"]
