# API REST [Assembly]

This project is a simple REST API developed in Assembly. I am learning Assembly and developing this project in my spare time. The server creation part was obtained from another repository, but since I no longer have the link, I made some modifications and organized the code.

## How to use with Docker and Docker Compose

### Prerequisites

Make sure you have Docker and Docker Compose installed on your machine. If not, follow the instructions below to install them:

- **Docker:** [Docker Installation Documentation](https://docs.docker.com/get-docker/)
- **Docker Compose:** [Docker Compose Installation Documentation](https://docs.docker.com/compose/install/)

### Steps

1. **Clone the repository:**

   Clone the repository to your machine with the following command:
   ```bash
   git clone [repository-url]
   cd [repository-folder]

2. **Build and run the containers with Docker Compose:**

   In the directory where the repository is located, run the following command to build and start the server:
   ```bash
   docker-compose up --build

3. **Accessing the server:**

   The server will be running inside the Docker container and available on port 8033. You can access it using the following URL:
   ```bash
   http://localhost:8033