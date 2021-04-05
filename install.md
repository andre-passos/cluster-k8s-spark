Pre-Req
# In all nodes:

sudo apt install docker && sudo apt install bridge-utils


# Edit cluster/ubuntu/build.sh:
FLANNEL_VERSION=${FLANNEL_VERSION:-"0.13.0"}
ETCD_VERSION=${ETCD_VERSION:-"3.4"}
KUBE_VERSION=${KUBE_VERSION:-"1.20.5"}