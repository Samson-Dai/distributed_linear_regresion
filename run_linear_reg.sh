#!/bin/bash
#SBATCH -p RM-shared
#SBATCH -t 00:10:00
#SBATCH --ntasks-per-node=2

export NXF_OPTS="-Xms500M -Xmx2G" # limit NF to 2 GB of memory

# sets up the offsite directory structure
source ~/.research_config

data_dir=$LOCAL_LINEAR_REG_DATA_DIR"example_data.rds"
k=10
result_dir=$LOCAL_LINEAR_REG_DATA_DIR"results"
work_dir=$LOCAL_LINEAR_REG_DATA_DIR"work"
#######################
# Run Nextflow pipeline
#######################
rm -f trace.txt

# nextflow run $glmeiv_nf_pipeline \
nextflow run https://github.com/Samson-Dai/distributed_linear_regresion -r main \
--data $data_dir \
--k $k \
--result_dir $result_dir \
-with-trace -w $work_dir