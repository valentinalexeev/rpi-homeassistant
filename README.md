[![Docker Stars](https://img.shields.io/docker/stars/valentinalexeev/rpi-homeassistant.svg)](https://hub.docker.com/r/valentinalexeev/rpi-homeassistant/) [![Docker Pulls](https://img.shields.io/docker/pulls/valentinalexeev/rpi-homeassistant.svg)](https://hub.docker.com/r/valentinalexeev/rpi-homeassistant/)

# rpi-homeassistant
HomeAssistant Docker image for RaspberryPi

A small image with no pre-built dependencies of Home-Assistant for RaspberryPi. This image is available in Docker registry as valentinalexeev/rpi-homeassistant.

# Using with Docker Compose
```yaml
  homeassistant:
    restart: unless-stopped
    image: valentinalexeev/rpi-homeassistant:latest
    network_mode: "host"
    ports:
      - "8123:8123"
    volumes:
      - ./PATH/TO/CONFIGURATION:/usr/src/app/config
      - /etc/localtime:/etc/localtime:ro
```

# Building your own image
I use the following command to build the image on my RPi3:
```sh
docker build --build-arg version=0.51.2 -t valentinalexeev/rpi-homeassistant:latest -t valentinalexeev/rpi-homeassistant:0.51.2 -t valentinalexeev/rpi-homeassistant:0.51 .
```
