# set workspace and dependencies
export WORK_SPACE=$HOME/intel_pkg
export SQUAD_DIR=$WORK_SPACE/intel_nlp/data/squad_dir

# download tensorflow code 
export BERT_SPACE=$WORK_SPACE/intel_nlp/language_modelling/bert
mkdir -p $BERT_SPACE
cd $BERT_SPACE
git clone https://github.com/IntelAI/models intel_model_zoo

# download tensorflow trained models
export TRAINED_MODELS=$BERT_SPACE/trained_models
mkdir $TRAINED_MODELS
cd $TRAINED_MODELS
wget https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip 
unzip uncased_L-12_H-768_A-12.zip 
rm -rf uncased_L-12_H-768_A-12.zip

