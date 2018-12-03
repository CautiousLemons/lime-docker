#!/bin/bash
# Start streaming the file
ls /dev/video*
if [ $? -eq 0 ]; then
    echo "Changing permissions..."
    lime
    echo "Video device(s) mounted successfully!"
    stream &
    firefox -new-tab meet.jit.si/random
else
    echo "No mounted video device founded."
fi
