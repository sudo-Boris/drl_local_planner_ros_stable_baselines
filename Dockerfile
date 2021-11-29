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

#Creating virtualenv for python3
# RUN pip3 install \
#     pyyaml \
#     rospkg \
#     catkin_pkg \
#     exception \
#     tensorflow=="1.13.1" \
#     gym \
#     pyquaternion \ 
#     mpi4py \
#     matplotlib

RUN sudo apt-get install -y ros-kinetic-gazebo-ros

RUN virtualenv /venv_p3 --python=python3

ADD requirements.txt requirements.txt
RUN /venv_p3/bin/pip install -r requirements.txt

RUN git clone https://github.com/RGring/stable-baselines.git stable_baselines
WORKDIR /stable_baselines
RUN /venv_p3/bin/pip install -e .

WORKDIR /

RUN echo "export PYTHONPATH="":${PYTHONPATH}" >> /root/.bashrc
RUN echo "source /catkin_ws/devel/setup.sh" >> /root/.bashrc
RUN echo "alias refresh='source /root/.bashrc'" >> /root/.bashrc

RUN cd / && mkdir /catkin_ws
WORKDIR /catkin_ws

# Building catkin_ws
# RUN mkdir -p /usr/catkin_ws/src
# WORKDIR /usr/catkin_ws/src
# # RUN git clone https://github.com/RGring/drl_local_planner_ros_stable_baselines

# RUN mkdir drl_local_planner_ros_stable_baselines && cd drl_local_planner_ros_stable_baselines
# WORKDIR /usr/catkin_ws/src/drl_local_planner_ros_stable_baselines
# ADD . .
# WORKDIR /usr/catkin_ws/src
# RUN ls

# RUN cp drl_local_planner_ros_stable_baselines/.rosinstall .
# RUN rosws update
# RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /usr/catkin_ws; catkin_make'

# RUN /venv_p3/bin/pip install -e /usr/catkin_ws/src/drl_local_planner_forks/stable-baselines

# RUN mv /usr/catkin_ws/src/drl_local_planner_ros_stable_baselines/rl_bringup/config/path_config_docker.ini \
# /usr/catkin_ws/src/drl_local_planner_ros_stable_baselines/rl_bringup/config/path_config.ini

# WORKDIR /usr/catkin_ws/src/drl_local_planner_ros_stable_baselines/start_scripts/

# ENTRYPOINT ./entrypoint_ppo2.sh "$AGENT_NAME" "$NUM_SIM_ENVS"
