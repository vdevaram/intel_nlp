## Installation of intel optimized frameworks
### TensorFlow
#### pip package
`pip install intel-tensorflow==<version>`
#### source code
```
# Here the build with dockers is given. Use similar commands from Dockerfiles to install on Baremetal.
export WORK_SPACE=$HOME/intel_pkg
mkdir -p $WORK_SPACE
cd $WORK_SPACE
git clone https://github.com/vdevaram/intel_nlp.git
# Inference build. If needed, change the Tensorflow version and Bazel version in the Dockerfile "Dockerfile_TF_U18"
docker build -f $WORK_SPACE/intel_nlp/Dockerfiles/tensorflow/Dockerfile_TF_U18 -t itf_u18 .
# Distributed training build with OpenMPI and Horovod
docker build -f $WORK_SPACE/intel_nlp/Dockerfiles/tensorflow/Dockerfile_TF_U18_OMPI_HVD -t itf_u18_ompi_hvd .
# Incremental openMPI and Horovod build from Inference build
docker build -f $WORK_SPACE/intel_nlp/Dockerfiles/tensorflow/Dockerfile_base_ITF_OMPI_HVD -t itf_u18 .

```
