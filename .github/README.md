# OpenAudible in Docker

Run [OpenAudible](http://openaudible.org/) directly in your browser.  
Container built on [linuxserver/docker-baseimage/selkies](https://github.com/linuxserver/docker-baseimage-selkies), running the official releases of OpenAudible from their [github](https://github.com/openaudible/openaudible/releases)  

## Application Setup

The application can be accessed at:

* http://yourhost:3000/
* https://yourhost:3001/

## Usage

Some snippets to get you started.

### docker-compose

```yaml
services:
  openaudible:
    image: ghcr.io/lanjelin/openaudible-docker:latest
    container_name: openaudible
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Oslo
      - CUSTOM_USER=JohnDoe # optional, but recommended if exposing to -
      - PASSWORD=a-safe-pw  # the internet without any other form of authentication
    ports:
      - "3000:3000" #http
      - "3001:3001" #https
    volumes:
      - /path/to/config:/config
    restart: unless-stopped
```

### docker cli

```bash
docker run -d \
  --name=openaudible \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Oslo \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /path/to/config:/config \
  --restart unless-stopped \
  ghcr.io/lanjelin/openaudible-docker:latest
```

Additional environment variables can be found [here](https://github.com/linuxserver/docker-baseimage-kasmvnc#options).
