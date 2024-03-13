# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenVPN and other useful tools
RUN apt-get update && apt-get install -y \
    git-core\
    openvpn \
    iptables \
    sudo \
    bash-completion \
    command-not-found \
    nano \
    vim \
    tree \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create a non-root user 'devuser' with sudo access
RUN useradd -m devuser && \
    echo "devuser:devuser" | chpasswd && \
    usermod -aG sudo devuser

# Set work directory
WORKDIR /home/devuser

# Switch to your non-root user
USER devuser

# Configure git for the user (adjust as needed)
RUN git config --global user.email "bdcabreran@unal.edu.co" && \
    git config --global user.name "bdcabreran"

# Default command
CMD ["/bin/bash"]
