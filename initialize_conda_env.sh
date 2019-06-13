#!/bin/bash

my_env=$(head -1 /tmp/requirements.yml | cut -d' ' -f2 | tr -d '\n')

echo "Searching for conda environment named: ${my_env}"

# Create conda environment:
# 1) Search for conda environment to see if it already exists
# 2) Delete if exists
# 3) Recreate using requirements.yml file
conda env list | cut -d' ' -f1 | if grep -q $my_env; then
	echo "conda environment already exists.... deleting now"
	conda deactivate
	conda env remove -n $my_env
	echo "recreating environment using updated requirements file"	
else
	echo "Conda environment not found.... creating now"
fi

conda env create -f /tmp/requirements.yml
echo "source activate $my_env" > ~/.bashrc