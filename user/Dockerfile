# Stage 1: Install dependencies
FROM node:20-alpine AS builder
WORKDIR /opt/server
COPY package*.json ./
RUN npm install --omit=dev
COPY *.js ./

# Stage 2: Create lightweight runtime image
FROM node:20-alpine
WORKDIR /opt/server
COPY --from=builder /opt/server/node_modules ./node_modules
COPY --from=builder /opt/server/*.js ./
ENV MONGO=true \
    REDIS_URL=redis://redis:6379 \
    MONGO_URL=mongodb://mongo:27017/users
EXPOSE 8080
CMD ["node", "server.js"]



# FROM node:20
# WORKDIR /opt/server
# COPY package*.json .
# COPY *.js .
# RUN ["npm", "install"]
# ENV MONGO=true \
#     REDIS_URL='redis://redis:6379' \
#     MONGO_URL="mongodb://mongo:27017/users"
# EXPOSE 8080
# CMD ["node", "server.js"]
