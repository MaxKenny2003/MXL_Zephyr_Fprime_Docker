# Pull from the newest Ubuntu image
FROM ubuntu:24.04

# Make the working directory app
WORKDIR /app

RUN apt-get update && apt-get install

RUN apt-get install -y --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget python3-dev python3-venv python3-tk \
  xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"	
# Make path point to the new virtual environment as well

RUN pip install west

WORKDIR /root/zephyrproject
COPY west.yml my-app/
RUN west init -l my-app \
    && west update --narrow -o=--depth=1 \
    && pip install -r zephyr/scripts/requirements.txt \
    && west zephyr-export \
    && west sdk install --toolchains arm-zephyr-eabi

RUN pip install --break-system-packages fprime-bootstrap

WORKDIR /root/zephyrproject

# Force Docker container to open into a bash terminal
CMD ["bash"]
