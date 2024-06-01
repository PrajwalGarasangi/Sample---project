# Use a Linux base image

FROM ubuntu:latest
 
# Set environment variables

ENV SRVPORT=4499 \

    RSPFILE=response
 
# Install necessary packages

RUN apt-get update && apt-get install -y \

    netcat \

    fortune \

    cowsay \

    && rm -rf /var/lib/apt/lists/*
 
# Copy the script into the container

COPY your_script.sh /usr/local/bin/wisecow.sh
 
# Make the script executable

RUN chmod +x /usr/local/bin/wisecow.sh
 
# Expose the port

EXPOSE $SRVPORT
 
# Run the script when the container starts

CMD ["/usr/local/bin/wisecow.sh"]
