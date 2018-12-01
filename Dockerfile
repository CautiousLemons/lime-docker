FROM jrottenberg/ffmpeg:4.0-ubuntu

# MAINTAINER Amir Haghighati <haghighati.amir@gmail.com>
# https://github.com/anewage/

WORKDIR /root/lime

# Install packages
#RUN apt update -y && \
#    apt upgrade -y && \
#    apt install -y firefox xvfb

# Cleanup
RUN apt autoremove -y && apt clean -y

# Copy the video and initial script file
COPY v1.mp4 /root/lime
COPY init.sh /root/lime
COPY bin /bin

# Make the script runnable
RUN chmod +x /root/lime/init.sh
RUN chmod +x /bin/stream

# ENTRYPOINT
ENTRYPOINT ["./init.sh"]
