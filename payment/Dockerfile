# Stage 1: Builder
FROM python:3.12-slim AS builder
WORKDIR /install
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: Runtime
FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    CART_HOST=cart \
    CART_PORT=8080 \
    USER_HOST=user \
    USER_PORT=8080 \
    AMQP_HOST=rabbitmq \
    AMQP_USER=roboshop
# Create non-root user
RUN groupadd -r appgroup && \
    useradd -r -g appgroup -d /opt/server -s /usr/sbin/nologin appuser
WORKDIR /opt/server
# Copy only installed packages from builder
COPY --from=builder /install /usr/local
# Copy application files
COPY --chown=appuser:appgroup *.py .
COPY --chown=appuser:appgroup *.ini .
# Switch to non-root user
USER appuser
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
