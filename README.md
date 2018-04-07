# docker-bionic-vnc

Simple and minimal Docker image providing Xfce4 Desktop, VNC server and SSH daemon.

#### Configuration

To set up remote X framebuffer display resolution open `Dockerfile` and edit

```sh
ENV SCREEN 1920x1080x24
```

#### Build Image

```sh
git clone https://github.com/jkuri/docker-bionic-vnc.git
docker build -t bionic-vnc docker-bionic-vnc/
```

#### Run Image

```sh
docker run -dit -p 5900:5900 -p 22:22 --rm bionic-vnc
```

#### Connect With VNC

Use `vncviewer` or similar software to connect to container. Predefined password is `ubuntu`.

#### LICENCE

MIT
