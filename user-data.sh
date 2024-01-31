#!/bin/bash

# Update the operating system and install Docker
sudo yum update -y
sudo yum install -y docker

# Start the Docker service
sudo systemctl start docker


# Add the ec2-user to the Docker group
sudo usermod -a -G docker ec2-user

# Configure Docker to start on boot
sudo systemctl enable docker

# Pull the Docker image from Docker Hub
sudo docker pull mohd1995/webhosting

# Run the Docker container with the latest image
sudo docker run -d -p 80:80 mohd1995/webhosting:latest

