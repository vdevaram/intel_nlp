export WORK_SPACE=$HOME/intel_pkg
export BERT_SPACE=$WORK_SPACE/bert
export SQUAD_DIR=$WORK_SPACE/data/squad_dir
mkdir -p SQUAD_DIR
mkdir -p $BERT_SPACE
cd $BERT_SPACE
git clone https://github.com/IntelAI/models
cd $SQUAD_DIR
wget https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json
wget https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json
wget https://raw.githubusercontent.com/allenai/bi-att-flow/master/squad/evaluate-v1.1.py 
