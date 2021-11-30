FROM ros:kinetic-robot-xenial

RUN apt-get update && apt-get install -y \
  libqt4-dev \
  libopencv-dev \
  liblua5.2-dev \
  virtualenv \
  screen \
  python3-dev \
  python3 \
  git \
  ros-kinetic-tf2-geometry-msgs \
  ros-kinetic-navigation \
  ros-kinetic-rviz 

RUN apt-get install -y apt-utils python3-pip

RUN sudo apt-get install -y ros-kinetic-gazebo-ros

RUN virtualenv /venv_p3 --python=python3

ADD requirements.txt requirements.txt
RUN /venv_p3/bin/pip install -r requirements.txt

WORKDIR /

RUN echo "export PYTHONPATH="":${PYTHONPATH}" >> /root/.bashrc
RUN echo "source /catkin_ws/devel/setup.sh" >> /root/.bashrc
RUN echo "alias refresh='source /root/.bashrc'" >> /root/.bashrc
RUN echo "alias venv='source /venv_p3/bin/activate'" >> /root/.bashrc

RUN cd / && mkdir /catkin_ws
WORKDIR /catkin_ws

