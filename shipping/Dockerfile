FROM maven:3.9.11
EXPOSE 8080
WORKDIR /opt/server
COPY pom.xml .
COPY src ./src
RUN mvn clean package 
RUN mv target/shipping-1.0.jar shipping.jar 
ENV CART_ENDPOINT=<CART-SERVER-IPADDRESS>:8080 \
    DB_HOST=<MYSQL-SERVER-IPADDRESS>
CMD ["java", "-jar", "shipping.jar"]