#!/bin/bash

echo "Bash version ${BASH_VERSION}..."
for i in $(seq 0 200)
  do
	echo $i times run
	mkdir 2nd_rlpolicy_sgf_$i
	mkdir 2nd_rlpolicy_data_$i
	KERAS_BACKEND=theano THEANO_FLAGS='device=gpu0' python make_datasets_RL_policy.py 2nd_rlpolicy_sgf_$i 2nd_rlpolicy_data_$i 2nd_rlpolicy_model_$i
	KERAS_BACKEND=theano THEANO_FLAGS='device=gpu0' python extract_dataset_from_sgf.py 2nd_rlpolicy_sgf_$i 2nd_rlpolicy_data_$i 2nd_rlpolicy_model_$i
	KERAS_BACKEND=theano THEANO_FLAGS='device=gpu0' python RL_policy_net.py 2nd_rlpolicy_sgf_$i 2nd_rlpolicy_data_$i 2nd_rlpolicy_model_$i
 done