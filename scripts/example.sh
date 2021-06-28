if [ "$1" == "l1" ]; then
	echo "l1"
	python -m train --env_name MiniGrid-MultiRoom-N4-Random-v0\
	--num_processes=64 \
	--level_replay_strategy value_l1 \
	--level_replay_score_transform rank \
	--level_replay_temperature=0.1 \
	--staleness_coef=0.1 \
	--verbose \
	--xpid l1\

elif [ "$1" == "uniforn" ]; then
 	echo "uniform"
	python -m train --env_name MiniGrid-MultiRoom-N4-Random-v0\
	--num_processes=64 \
	--level_replay_score_transform rank \
	--level_replay_temperature=0.1 \
	--staleness_coef=0.1 \
	--verbose \
	--xpid uniform1\
else
	echo "please add 'l1' or 'unfiform' as arguments"
fi