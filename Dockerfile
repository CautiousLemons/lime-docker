FROM ubuntu:18.04

# MAINTAINER Amir Haghighati <haghighati.amir@gmail.com>
# https://github.com/anewage/

# Define Working Directory
WORKDIR /lime

# Install packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
     ffmpeg \
     build-essential \
     git \
     libopus-dev \
     libmp3lame-dev \
     libfdk-aac-dev \
     libvpx-dev \
     libx264-dev \
     libass-dev \
     libtheora-dev \
     libvorbis-dev \
     mercurial \
     yasm

# Cleanup
RUN apt autoremove -y && apt clean -y

# Install v4l2loopback
COPY install.sh /lime
RUN chmod +x /lime/install.sh

# Copy the video file
COPY v1.mp4 /lime

# Set environment variables
ENV HOME /lime

# Define default command
CMD ./install.sh

# ENTRYPOINT
# TODO: stop container from dying
ENTRYPOINT ["/bin/bash", "-l", "-c"]
