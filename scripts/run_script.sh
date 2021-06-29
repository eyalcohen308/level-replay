set -x
if [ $# -eq 1 ]; then
	echo "please spcify also the serial number of one of the following kind of maze [1: Multiroom-N4-Random, 2: ObstructedMazeGamut-Easy, 3: ObstructedMazeGamut-Medium]"

else
	cuda_id=0
	if [ $# -eq 3 ]; then
	cuda_id=$3
	fi

	env_name=""
	num_steps=0
	if [ "$2" == "1" ]; then
		env_name="MiniGrid-MultiRoom-N4-Random-v0"
		num_steps=100e+6
		save_name="Multiroom-N4-Random"

	elif [ "$2" == "2" ]; then
		env_name="MiniGrid-ObstructedMaze-1Dl-v0"
		num_steps=80e+6
		save_name="ObstructedMazeGamut-Easy"
	elif [ "$2" == "3" ]; then
		env_name="MiniGrid-ObstructedMaze-1Dlh-v0"
		num_steps=250e+6
		save_name="ObstructedMazeGamut-Medium"
	fi
	if [ "$1" == "l1" ]; then
		echo "l1"
		python -m train --env_name $env_name\
		--num_processes=64 \
		--level_replay_strategy value_l1 \
		--level_replay_score_transform rank \
		--level_replay_temperature=0.1 \
		--staleness_coef=0.1 \
		--verbose \
		--xpid "l1_${save_name}_$$" \
		--num_env_steps $num_steps \
		--cuda_id $cuda_id \

	elif [ "$1" == "uniform" ]; then
		echo "uniform"
		python -m train --env_name $env_name\
		--num_processes=64 \
		--level_replay_score_transform rank \
		--level_replay_temperature=0.1 \
		--staleness_coef=0.1 \
		--verbose \
		--xpid "uniform_${save_name}_$$"\
		--num_env_steps $num_steps \
		--cuda_id $cuda_id \

	else
		echo "please add 'l1' or 'unfiform' as arguments"
	fi
fi
