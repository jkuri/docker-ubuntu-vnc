# docker-ubuntu-vnc

Simple Ubuntu Docker image providing Xfce4 desktop, VNC server and SSH daemon.

<p align="center">
  <img src="https://user-images.githubusercontent.com/1796022/38460477-b860d604-3aba-11e8-98ce-6f5b890d79df.png">
</p>

#### Configuration

To set up remote X framebuffer display resolution open `xvfb` file and edit this line:

```sh
XVFBARGS=":99 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset"
```

#### Build Image

```sh
git clone https://github.com/jkuri/docker-ubuntu-vnc.git
docker build -t bionic-vnc docker-bionic-vnc/
```

#### Run Image

```sh
docker run -dit -p 5900:5900 -p 22:22 --rm bionic-vnc
```

or use my prebuilt image:

```sh
docker run -dit -p 5900:5900 -p 22:22 --rm jkuri/docker-ubuntu-vnc:latest
```

#### Connect With VNC

Use `vncviewer` or similar software to connect to container. Predefined password is `ubuntu`.

#### LICENCE

MIT
