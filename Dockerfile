FROM osrf/ros:noetic-desktop-full

WORKDIR /ws

RUN apt update && apt upgrade -y && apt install -y vim \
        sudo \
        libgl1-mesa-glx libgl1-mesa-dri \
        bash-completion \
        spyder \
        vim \
        gdb \
        net-tools \
        iputils-ping \
        htop \
        curl \
        libsdl-image1.2-dev \
        libsdl-dev\
        ros-noetic-tf2-sensor-msgs \
    && useradd -ms /bin/bash -G sudo -u 1000 gnap \
    && echo "gnap ALL=NOPASSWD:ALL" > /etc/sudoers.d/NO_PASSWORD \
    && echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[0;36m\]\u\[\033[1;33m\]@\[\033[0;36m\]\h\[\033[00m\]:\[\033[1;35m\]\w\[\033[00m\]\n\$ '" >> /home/gnap/.bashrc \
    && echo "source /opt/ros/noetic/setup.bash" >> /home/gnap/.bashrc \
    && echo "source pcontainer" >> /home/gnap/.bashrc \
    && rm -rf /var/lib/apt/lists/*

CMD /bin/bash
