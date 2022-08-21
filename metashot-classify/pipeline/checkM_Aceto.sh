#!/bin/bash -l
#
#SBATCH -n 24 #number cores
#SBATCH -p batch
#SBATCH -o logs/checkm_Aceto.log
#SBATCH -e logs/checkm_Aceto.elog
#SBATCH --mem 96G #memory in Gb
#SBATCH -t 96:00:00 #time in hours:min:sec


module load checkm

MIN=2500
BINFOLDER=groups/Acetobacteraceae
OUTPUT=groups_checkM
NAME=Acetobacteraceae
CPU=24

mkdir -p $OUTPUT/$NAME
checkm lineage_wf -t $CPU -x fa $BINFOLDER $OUTPUT/$NAME

checkm tree $BINFOLDER -x .fa -t $CPU $OUTPUT/$NAME/tree

checkm tree_qa $OUTPUT/$NAME/tree -f $OUTPUT/$NAME/checkm.txt

