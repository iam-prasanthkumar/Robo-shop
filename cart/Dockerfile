# Stage 1: Install dependencies
FROM node:20-alpine AS builder
WORKDIR /opt/server
COPY package*.json ./
COPY *.js ./
RUN npm install


# Stage 2: Create lightweight runtime image
FROM node:20-alpine
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
COPY --from=builder --chown=roboshop:roboshop /opt/server/node_modules ./node_modules
COPY --from=builder --chown=roboshop:roboshop /opt/server/*.js ./
ENV REDIS_HOST=redis \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT=8080
EXPOSE 8080
CMD ["node", "server.js"]




# FROM node:20
# WORKDIR /opt/server
# COPY package*.json .
# COPY *.js .
# RUN ["npm", "install"]
# ENV REDIS_HOST=redis \
#     CATALOGUE_HOST="catalogue" \
#     CATALOGUE_PORT=8080
# CMD ["node", "server.js"]
