# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Update the package repository and install packages
RUN apt-get update && \
    apt-get install -y \
    openvpn \
    dialog \
    net-tools \
    iputils-ping \
    wget \
    curl \
    nano \
    vim \
    less \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Set the locale to support UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


# The following ENV line is to enable color support in the terminal
ENV TERM xterm-256color

# The following lines are optional and can be customized based on your needs:

# Copy the current directory contents into the container at /usr/src/app
# COPY . .

# Make port 1194 available to the world outside this container, as it's the default OpenVPN port
EXPOSE 1194/udp

# Define environment variable
# ENV NAME Value

# Run OpenVPN when the container launches. Note: This is a placeholder. You'll need to adjust the command based on your specific OpenVPN configuration file and execution preferences.
# CMD ["openvpn", "your-config.ovpn"]
