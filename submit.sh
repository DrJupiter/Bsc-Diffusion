#!/bin/bash
#BSUB -J bsc_test
#BSUB -o bsc_t_%J.out
#BSUB -e bsc_t_%J.err
#BSUB -q gpuv100
#BSUB -gpu "num=1:mode=exclusive_process"
#BSUB -n 1
#BSUB -R "rusage[mem=5G]"
#BSUB -R "span[hosts=1]"
#BSUB -W 24:00
# end of BSUB options

echo "starts working"


module swap cuda/11.7
module load cudnn/v8.3.2.44-prod-cuda-11.X 

source /zhome/59/e/156513/BSCvenv/bin/activate

module load python3/3.11.1

python3 main.py

echo "finished working"

