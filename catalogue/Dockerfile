# Stage 1: Install dependencies
FROM node:20-alpine AS builder
WORKDIR /opt/server
COPY package*.json .
COPY *.js .
RUN npm install

# Stage 2: Runtime
FROM node:20-alpine
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV NODE_ENV=production \
    MONGO=true \
    MONGO_URL=mongodb://mongo:27017/catalogue
WORKDIR /opt/server
# Use the built-in non-root user
USER roboshop
# Copy production dependencies
COPY --from=builder --chown=roboshop:roboshop /opt/server/node_modules ./node_modules
# Copy application code
COPY --chown=roboshop:roboshop *.js ./
CMD ["node", "server.js"]




# FROM node:20
# WORKDIR /opt/server
# COPY package*.json .
# COPY *.js .
# RUN ["npm", "install"]
# ENV MONGO=true \
#     MONGO_URL="mongodb://mongo:27017/catalogue"
# CMD ["node", "server.js"]
