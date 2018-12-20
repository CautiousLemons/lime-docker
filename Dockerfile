FROM jrottenberg/ffmpeg:4.0-ubuntu

# MAINTAINER Amir Haghighati <haghighati.amir@gmail.com>
# https://github.com/anewage/

WORKDIR /home/lime

# Install packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y firefox xvfb sudo

# Cleanup
RUN apt autoremove -y && apt clean -y

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/lime && \
    echo "lime:x:${uid}:${gid}:Lime,,,:/home/lime:/bin/bash" >> /etc/passwd && \
    echo "lime:x:${uid}:" >> /etc/group && \
    echo "lime ALL=(ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/lime && \
    chmod 0440 /etc/sudoers.d/lime && \
    chown ${uid}:${gid} -R /home/lime

# Copy the video and initial script file
COPY init.sh /home/lime
COPY user.js /home/lime
COPY bin /bin
#COPY config/.mozilla /home/lime/.mozilla

# Make the script runnable
RUN chmod +x /home/lime/init.sh
RUN chmod +x /bin/*
RUN echo "=========================READY!!!!!=========================="

# Place the user
USER lime
ENV HOME /home/lime

# ENTRYPOINT
ENTRYPOINT ["./init.sh"]
