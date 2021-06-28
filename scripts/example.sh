set -x
if [ $# -ne 2 ]; then
	echo "please spcify also the serial number of one of the following kind of maze [1: Multiroom-N4-Random, 2: ObstructedMazeGamut-Easy, 3: ObstructedMazeGamut-Medium]"
else
	env_name=""
	if [ "$2" == "1" ]; then
		env_name="MiniGrid-MultiRoom-N4-Random-v0"
	elif [ "$2" == "2" ]; then
		env_name="MiniGrid-ObstructedMaze-1Dl-v0"
	elif [ "$2" == "3" ]; then
		env_name="MiniGrid-ObstructedMaze-1Dlh-v0"
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
		--xpid "l1_${env_name}_debug"\

	elif [ "$1" == "uniforn" ]; then
		echo "uniform"
		python -m train --env_name $env_name\
		--num_processes=64 \
		--level_replay_score_transform rank \
		--level_replay_temperature=0.1 \
		--staleness_coef=0.1 \
		--verbose \
		--xpid "uniform_${env_name}_debug"\
	else
		echo "please add 'l1' or 'unfiform' as arguments"
	fi
fi