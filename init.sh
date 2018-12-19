#!/bin/bash
# Start streaming the file
#xvfb-run firefox &
#sleep 2
#ps -aux | grep Xvfb | kill `awk '{print $2}'i`
ls /dev/video*
if [ $? -eq 0 ]; then
    echo "Changing permissions..."
    lime
    echo "Video device(s) mounted successfully!"
    stream &
#    cp user.js .mozilla/firefox/*.default/
#    echo "\n\n=================================== COPIED ===="
    firefox --new-tab $ROOM_URL
#    xvfb-run --auto-servernum firefox --new-tab $ROOM_URL
else
    echo "No mounted video device founded."
fi
