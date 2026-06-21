# Stage 1: Build the application
FROM maven:3.9.11 AS builder
WORKDIR /opt/server
COPY pom.xml .
COPY src ./src
RUN mvn clean package && \ 
    mv target/shipping-1.0.jar shipping.jar

# Stage 2: Create lightweight runtime image
FROM eclipse-temurin:17-jre-jammy
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
COPY --from=builder --chown=roboshop:roboshop /opt/server/target/shipping-1.0.jar shipping.jar
EXPOSE 8080
ENV CART_ENDPOINT=cart:8080 \
    DB_HOST=mysql
CMD ["java", "-jar", "shipping.jar"]



# FROM maven:3.9.11
# EXPOSE 8080
# WORKDIR /opt/server
# COPY pom.xml .
# COPY src ./src
# RUN mvn clean package 
# RUN mv target/shipping-1.0.jar shipping.jar 
# ENV CART_ENDPOINT=cart:8080 \
#     DB_HOST=mysql
# CMD ["java", "-jar", "shipping.jar"]
