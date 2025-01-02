#!/bin/bash

nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits | awk -F ',' '{printf "GPU: %s%% | Mem: %s/%s MiB\n", $1, $2, $3}'
