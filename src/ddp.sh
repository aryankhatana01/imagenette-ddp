#!/bin/bash
echo "Number of GPUs: "
read n_gpu
NUM_PROC=$n_gpu
shift
launcher=$(python -c "from os import path; import torch; print(path.join(path.dirname(torch.__file__), 'distributed', 'launch.py'))")
python $launcher --nnode=1 --node_rank=0 --nproc_per_node=$NUM_PROC train_ddp.py --local_world_size=$NUM_PROC
