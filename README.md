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

Now, run the container and mount the device to the device number 0 (i.e., `/dev/video0`):
```
docker run -it --device /dev/video1:/dev/video0 anewage/lime-docker
```

Inside the host, consume the video feed:
```
ffplay /dev/video1
```
