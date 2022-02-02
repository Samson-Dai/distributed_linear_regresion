#!/bin/bash
#SBATCH -p RM-shared
#SBATCH -t 48:00:00
#SBATCH --ntasks-per-node=2

export NXF_OPTS="-Xms500M -Xmx2G" # limit NF to 2 GB of memory

data_dir="/Users/Administrator/Desktop/samson1/CMU/year1_summer/research/nextflow/distributed_linear_regresion/example_data.rds"
k=10
result_dir="/Users/Administrator/Desktop/samson1/CMU/year1_summer/research/nextflow/distributed_linear_regresion/result"
work_dir="/Users/Administrator/Desktop/samson1/CMU/year1_summer/research/nextflow/distributed_linear_regresion/work"
#######################
# Run Nextflow pipeline
#######################
rm -f trace.txt

# nextflow run $glmeiv_nf_pipeline \
nextflow run nextflow -r main \
--data $data_dir \
--k $k \
--result_dir $result_dir \
-with-trace -w $work_dir