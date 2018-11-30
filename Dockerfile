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
     yasm \

# Install v4l2loopback
RUN git clone https://github.com/umlaeute/v4l2loopback.git . && \
    cd v4l2loopback && \
    make && make install && depmod -a \
    modprobe v4l2loopback exclusive_caps=1 \
    v4l2-ctl --list-devices

# Cleanup
RUN apt autoremove -y && apt clean -y

# Copy the video file
COPY v1.mp4 .

# Set environment variables
ENV HOME /lime

# Define default command
CMD ["bash"]
