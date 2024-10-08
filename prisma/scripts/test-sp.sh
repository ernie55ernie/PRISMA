array=(
# 0.2
# 0.4
# 0.6
# 0.8
# 1.0
# 1.2
# 1.4
# 1.6
# 1.8
# 2.0
# 2.2
# 2.4
# 2.6
# 2.8
# 3.0
3.2
3.4
3.6
3.8
4.0
4.2
4.4
4.6
4.8
5.0
)
counter=0

#For running different agents, add the following arg:
# --agent_type=sp \   #e.g., for Shortest Path agent
for j in ${array[@]}
	do 
	echo $j
	FLOAT=$(echo $j*1000 | bc)
	res1=${FLOAT/.*}
	echo $res1
	python3 main.py \
		--simTime=60 \
		--basePort=6000 \
		--train=0 \
		--seed=100 \
		--agent_type="sp" \
		--session_name="test_sp_ideal_v0_load_$res1" \
		--signaling_type="ideal" \
		--signalingSim=1 \
		--save_models=0 \
		--start_tensorboard=0 \
		--replay_buffer_max_size=15000 \
   		--link_delay="1" \
		--load_factor=$j \
		--logs_parent_folder=examples/abilene/ \
		--traffic_matrix_index=0 \
		--logging_timestep=1 \
		--max_out_buffer_size=16260 \
		#--load_path=examples/abilene/dqn_buffer_sp_init
# 		--training_trigger_type="time" \
# 		--adjacency_matrix_path=examples/abilene/adjacency_matrix.txt \
# 		--node_coordinates_path=examples/abilene/node_coordinates.txt \
# 		--traffic_matrix_index=5 \

done