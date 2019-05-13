#! /bin/sh

path_to_venv=$(awk -F "=" '/path_to_venv/ {print $2}' ../rl_agent/config/path_config.ini)
path_to_catkin_ws=$(awk -F "=" '/path_to_catkin_ws/ {print $2}' ../rl_agent/config/path_config.ini)
ros_ver=$(awk -F "=" '/ros_version/ {print $2}' ../rl_agent/config/path_config.ini)
# source ros stuff
source /opt/ros/$ros_ver/setup.bash
source $path_to_catkin_ws/devel/setup.bash
source $path_to_venv/bin/activate


# get params
agent_name=$1
total_timesteps=$2
policy=$3
gamma=$4
n_steps=$5
ent_coef=$6
learning_rate=$7
vf_coef=$8
max_grad_norm=$9
lam=${10}
nminibatches=${11}
noptepochs=${12}
cliprange=${13}
robot_radius=${14}
rew_fnc=${15}
num_stacks=${16}
disc_action_space=${17}
normalize=${18}
stage=${19}
pretrained_model_path=${20}
task_mode=${21}
num_sim=${22}

# start rl_agent
python ../rl_agent/scripts/train_scripts/train_ppo2.py $agent_name $total_timesteps $policy $gamma $n_steps $ent_coef $learning_rate $vf_coef $max_grad_norm $lam $nminibatches $noptepochs $cliprange $robot_radius $rew_fnc $num_stacks $disc_action_space $normalize $stage $pretrained_model_path $task_mode $num_sim

deactivate
IFS=$OLDIFS



