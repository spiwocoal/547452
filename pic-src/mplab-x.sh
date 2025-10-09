#!/bin/sh

podman run -itd --rm --network host --env DISPLAY --env _JAVA_AWT_WM_NONREPARENTING=1 \
	--security-opt label=type:container_runtime_t --privileged \
	-v /dev/bus/usb:/dev/bus/usb -v .:/media --name mplab --replace mplabx:latest
