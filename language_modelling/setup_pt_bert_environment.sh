# set workspace and dependencies
export WORK_SPACE=$HOME/intel_pkg
export SQUAD_DIR=$WORK_SPACE/intel_nlp/data/squad_dir

# download tensorflow code 
export BERT_SPACE=$WORK_SPACE/intel_nlp/language_modelling/bert
mkdir -p $BERT_SPACE
cd $BERT_SPACE
git clone https://github.com/huggingface/transformers.git
