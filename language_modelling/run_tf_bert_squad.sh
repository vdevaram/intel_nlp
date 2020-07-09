#common params 
export IFACE=bond0.123
export IP_PORT=192.168.116.174:9999
export CODE_DIR=/work_space/intel_nlp/language_modelling/bert/intel_model_zoo/models/language_modeling/tensorflow/bert_large/training/fp32
export SQUAD_DIR=/work_space/intel_nlp/data/squad_data
export BERT_BASE_DIR=/work_space/intel_nlp/language_modelling/bert/trained_models/uncased_L-12_H-768_A-12
export CKPT_DIR=$BERT_BASE_DIR/ckpt_qa
export CORES_PER_PROC=20
export THREADS_PER_CORE=1
export NUM_WORKERS=2
#rm -rf $CKPT_DIR/*
mpirun -np  $NUM_WORKERS --map-by ppr:1:socket:pe=$CORES_PER_PROC --allow-run-as-root --mca plm_rsh_args "-p 12345" -mca btl_tcp_if_include $IFACE -mca btl ^openib -mca pml ob1 -H $IP_PORT  --oversubscribe --report-bindings -x KMP_AFFINITY=granularity=fine,verbose,compact,1,0 -x OMP_NUM_THREADS=$CORES_PER_PROC -x KMP_BLOCKTIME=1 numactl -l python3 -u $CODE_DIR/run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v1.1.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v1.1.json \
  --train_batch_size=12 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$CKPT_DIR \
  --inter_op_parallelism_threads=1 \
  --intra_op_parallelism_threads=$OMP_NUM_THREADS
