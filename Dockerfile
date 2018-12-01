FROM jrottenberg/ffmpeg:4.0-ubuntu

# MAINTAINER Amir Haghighati <haghighati.amir@gmail.com>
# https://github.com/anewage/

# Define Working Directory
WORKDIR /lime

# Install packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y firefox xvfb

# Cleanup
RUN apt autoremove -y && apt clean -y

# Copy the video and initial script file
COPY v1.mp4 /lime
COPY init.sh /lime

# Make the script runnable
RUN chmod +x /lime/init.sh

# Set environment variables
ENV HOME /lime

# ENTRYPOINT
ENTRYPOINT ["./init.sh"]
