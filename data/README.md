This folder consists of sample code required for NLP data downloading
```
# set workspace
export WORK_SPACE=$HOME/intel_pkg
```
### BERT SQUAD data
```
export SQUAD_DIR=$WORK_SPACE/intel_nlp/data/squad_dir
mkdir -p $SQUAD_DIR
cd $SQUAD_DIR
wget https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json
wget https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json
wget https://raw.githubusercontent.com/allenai/bi-att-flow/master/squad/evaluate-v1.1.py
```
### MRPC data
```
export GLUE_DIR=$WORK_SPACE/intel_nlp/data/glue_dir
mkdir -p $GLUE_DIR
cd $GLUE_DIR
wget https://gist.githubusercontent.com/W4ngatang/60c2bdb54d156a41194446737ce03e2e/raw/17b8dd0d724281ed7c3b2aeeda662b92809aadd5/download_glue_data.py
python download_glue_data.py --data_dir=$GLUE_DIR --tasks MRPC
```
