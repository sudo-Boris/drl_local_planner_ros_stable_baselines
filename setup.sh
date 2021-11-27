# download repo

mkdir -p catkin_gring/src && cd catkin_gring/src
git clone --branch master https://github.com/ReykCS/drl_local_planner_ros_stable_baselines gring

# rosinstall

cp gring/.rosinstall .rosinstall
rosws update

# docker

cd gring/docker
chmod +x *.sh

./docker-run.sh

alias gring_start_docker=".${PWD}/docker-run.sh"
alias gring_stop_docker=".${PWD}/docker-stop.sh"