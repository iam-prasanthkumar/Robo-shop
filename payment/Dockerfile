FROM python:3.12
WORKDIR /opt/server
COPY requirements.txt .
COPY *.py .
COPY *.ini .
RUN pip install -r requirements.txt 
ENV CART_HOST=cart \
    CART_PORT=8080 \
    USER_HOST=user \
    USER_PORT=8080 \
    AMQP_HOST=rabbitmq \
    AMQP_USER=roboshop \
    AMQP_PASS=roboshop123

CMD ["uwsgi", "--ini", "payment.ini"]
