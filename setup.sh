# download repo

mkdir -p catkin_gring/src && cd catkin_gring/src
git clone --branch master https://github.com/ReykCS/drl_local_planner_ros_stable_baselines gring

# rosinstall

cp gring/.rosinstall .rosinstall
rosws update

# docker

cd gring/docker
chmod +x *.sh

./docker-build.sh

echo "Succefully built docker container for gring"

alias gring_start_docker="source ${PWD}/docker-run.sh"
alias gring_stop_docker="source ${PWD}/docker-stop.sh"

cd -

echo "You can now start the gring docker with: 'gring_start_docker' and stop it with 'gring_stop_docker'"