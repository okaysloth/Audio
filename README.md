# IMPORTANT - NO DOCKERHUB ANYMORE

Greetings. Dockerhub killed all deemix containers without any notice. That's why I have moved to gitlab. We will see if it will get removed here as well.

In order to run this container, you will have to exchange your previous image tag from "bocki/deemix" to "registry.gitlab.com/bockiii/deemix-docker"

That should be it, everything else stays the same. You will only get updates if you switch to the new source!


# deemix-docker

Deemix in a Docker container.

## How to run this

Deemix will work out of the box, but you should at least set a fixed port for the web interface and mount a folder to the container for where your downloads will go.

You can also map a folder on the host for the config file (mount a local folder to /config/), but that's optional. If they add or rework settings in the future, there is no guarantee that your old configs will work, so beware.

### Example for Docker:
```
$ docker run -d --name Deemix \
              -v /your/storage/path/:/downloads \
              -v /your/config/location:/config \
              -e PUID=1000 \
              -e PGID=1000 \
              -e ARL=1234567 \
              -p 6595:6595 \
              registry.gitlab.com/bockiii/deemix-docker
```

### Example for Docker Compose:
```
version: '3.3'
services:
    deemix:
        image: registry.gitlab.com/bockiii/deemix-docker
        container_name: Deemix
        volumes:
            - /your/storage/path/:/downloads
            - /your/config/location:/config
        environment:
            - PUID=1000
            - PGID=1000
            - ARL=1234567
        ports:
            - 6595:6595
```

### Updating Deemix

The container will look for a new update in the Deemix repo on every start and will update itself. So if you want to update Deemix, just stop and start the Container. Also works with docker-compose stop.

### Explanation:

`-v /your/storage/path/:/downloads`     - Path for your music downloads.

`-v /your/config/location:/config`      - OPTIONAL: Path to your local configuration.

`-e PUID=1000`                          - OPTIONAL: User ID of the user you want the container to run as in order to fix folder permission issues.

`-e PGID=1000`                          - OPTIONAL: Group ID, see above.

`-e ARL=1234567`                        - OPTIONAL: If you want Deemix to automatically log in for everyone who opens the website, provide your ARL token via this Environment variable.

`-p 6595:6595`                          - Port opened for the web interface.

`registry.gitlab.com/bockiii/deemix-docker`                          - This container.

To access the web interface, go to http://YOURSERVERIP:6595 

## Tags

`latest`                : Latest state of the master branch. Can be considered "working" but Deemix is under heavy development.

Tag includes `amd64`, `arm32v7` and `arm64v8` architectures.

## Disclaimer and Links

I am in no way affiliated with the Deemix project (or any other Deezloader-like project for that matter).

Gitlab link for this container: https://gitlab.com/Bockiii/deemix-docker

Repo for Deemix: https://notabug.org/RemixDev/deemix

Issue Tracker for this Docker: https://gitlab.com/Bockiii/deemix-docker/-/issues


Feel free to open an issue that is Docker related, and not related to Deemix development. Go to the Deemix repository for that.
