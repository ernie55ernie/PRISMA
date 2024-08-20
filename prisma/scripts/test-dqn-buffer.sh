array=(
2.4
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
		--agent_type="dqn_buffer" \
		--session_name="test_dqn_buffer_v0_load_$res1" \
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
		--load_path=examples/abilene/saved_models/train_abilene_ideal_ts_0_01_batch_512_lr_1e-3_gamma_1_final_eps_0_01_load_24_sync_05_loss_x1/final
# 		--training_trigger_type="time" \
# 		--adjacency_matrix_path=examples/abilene/adjacency_matrix.txt \
# 		--node_coordinates_path=examples/abilene/node_coordinates.txt \
# 		--traffic_matrix_index=5 \

done