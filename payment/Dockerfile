# Stage 1: Builder

FROM python:3.9.25-alpine3.21 AS builder

WORKDIR /opt/server
RUN apk add --no-cache \
    build-base \
    linux-headers \
    pcre-dev 

COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

# Stage 2: Runtime
FROM python:3.9.25-alpine3.21
EXPOSE 8080
WORKDIR /opt/server
RUN  apk add --no-cache pcre

RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    CART_HOST=cart \
    CART_PORT=8080 \
    USER_HOST=user \
    USER_PORT=8080 \
    AMQP_HOST=rabbitmq \
    AMQP_USER=roboshop
# Copy only installed packages from builder
COPY --from=builder /install /usr/local
# Copy application files
COPY --chown=roboshop:roboshop *.py .
COPY --chown=roboshop:roboshop *.ini .
COPY --chown=roboshop:roboshop requirements.txt .
# Switch to non-root user
USER roboshop
CMD ["uwsgi", "--ini", "payment.ini"]



# FROM python:3.12
# WORKDIR /opt/server
# COPY requirements.txt .
# COPY *.py .
# COPY *.ini .
# RUN pip install -r requirements.txt 
# ENV CART_HOST=cart \
#     CART_PORT=8080 \
#     USER_HOST=user \
#     USER_PORT=8080 \
#     AMQP_HOST=rabbitmq \
#     AMQP_USER=roboshop \
#     AMQP_PASS=roboshop123

# CMD ["uwsgi", "--ini", "payment.ini"]
