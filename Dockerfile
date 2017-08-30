FROM valentinalexeev/rpi-python3:latest

VOLUME /usr/src/app/config

EXPOSE 8123

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN pip3 install pytest-runner

#RUN wget https://raw.githubusercontent.com/home-assistant/home-assistant/${version}/requirements_all.txt && pip3 install -r requirements_all.txt && pip3 install homeassistant==${version}

ARG version=0.34.4
RUN pip3 install homeassistant==${version}

CMD ["hass", "--open-ui", "--config", "/usr/src/app/config"]
