# lime-docker
Docker image with the ability to stream a video as a fake webcam into an external device.

# Usage

## Create a dummy webcam device
Use `v4l2loopback` to create a dummy webcam device, mounted `/dev/video1` on the host:
```
sudo modprobe v4l2loopback exclusive_caps=1
```

List the devices to ensure that the video device has been created:
```
v4l2-ctl --list-devices
```

Now, run the container and mount the device to the device number 0 (i.e., `/dev/video0`). NOTE: Since we are running firefox, you have to also give the env variables of your screen socket:
```
docker run -ti --rm  -e DISPLAY=$DISPLAY        -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/video1:/dev/video0  lime
```
