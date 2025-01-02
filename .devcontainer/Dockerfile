FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    zsh \
    git \
    tzdata \
    pkg-config \
    libmysqlclient-dev \
    gcc \
    g++ \
    python3-dev \
    libffi-dev \
    libssl-dev 


RUN ln -fs /usr/share/zoneinfo/America/Belem /etc/localtime
RUN echo "America/Belem" > /etc/timezone

WORKDIR /app

COPY . .