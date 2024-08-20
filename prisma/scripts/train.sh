#!/bin/bash  

## Training DQN

#For running different agents, add the following arg:
# --agent_type=sp \   #e.g., for Shortest Path agent

#cd ..

python3 main.py \
	--seed=100 \
	--numEpisodes=5 \
	--simTime=60 \
	--basePort=6555 \
	--train=1 \
	--agent_type="dqn_buffer" \
	--session_name="train_abilene_ideal_ne_5_ts_0_01_batch_512_lr_1e-3_gamma_1_final_eps_0_01_load_50_sync_05_loss_x1"\
	--signaling_type="ideal" \
	--logs_parent_folder=examples/abilene/ \
	--traffic_matrix_root_path=examples/abilene/traffic_matrices/ \
	--traffic_matrix_index=0 \
	--training_step=0.01 \
	--batch_size=512 \
	--lr=0.001 \
	--exploration_final_eps=0.01 \
	--exploration_initial_eps=1.0 \
	--iterationNum=3000 \
	--gamma=1.0 \
	--save_models=1 \
	--start_tensorboard=0 \
	--replay_buffer_max_size=15000 \
   	--link_delay="1" \
	--load_factor=5.0 \
	--sync_step=0.5 \
# 	--load_path=examples/abilene/DQN_buffer_sp_init \
#	--adjacency_matrix_path=examples/abilene/adjacency_matrix.txt \
#	--node_coordinates_path=examples/abilene/node_coordinates.txt \
#	--training_trigger_type="time" \

sleep 5

#rm -r ../ns3-gym/scratch/prisma
