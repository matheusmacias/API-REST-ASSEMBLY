FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    zsh \
    git \
    tzdata \
    pkg-config \
    nasm \
    vim \
    mysql-client \
    libmysqlclient-dev \
    gcc \
    libc-dev \
    python3-dev \
    libffi-dev \
    libssl-dev \
    make \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -fs /usr/share/zoneinfo/America/Belem /etc/localtime && \
    echo "America/Belem" > /etc/timezone

WORKDIR /app

COPY . .
