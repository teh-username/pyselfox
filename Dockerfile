from python:alpine

MAINTAINER LA Roberto

# Add firefox to container
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.4/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories
RUN apk update && \
    apk add firefox-esr wget dbus-x11 ttf-freefont xvfb

# Add geckodriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz && \
    tar -zxvf geckodriver-v0.11.1-linux64.tar.gz && \
    mv ./geckodriver /usr/local/bin/ && \
    chmod a+x /usr/local/bin/geckodriver

# App specific setup
WORKDIR /src

COPY requirements.txt .

RUN pip install --trusted-host pypi.python.org -r requirements.txt

CMD ["python", "app.py"]

