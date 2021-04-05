#!/bin/bash

case "$1" in
    aws|AWS|"")
        echo "Instalando cluster Kubernetes na AWS"
        echo "Alterando parametros do cluster zona='$2' master_size='$3' minion_size='$4' e nr_workers='$5'"
        sed -i 's/ZONE=${KUBE_AWS_ZONE:-us-west-2a}/ZONE=${KUBE_AWS_ZONE:-'$2'}/g' ./kubernetes/cluster/aws/config-default.sh
        sed -i 's/MASTER_SIZE=${MASTER_SIZE:-t2.micro}/MASTER_SIZE=${MASTER_SIZE:-'$3'}/g' ./kubernetes/cluster/aws/config-default.sh
        sed -i 's/MINION_SIZE=${MINION_SIZE:-t2.micro}/MINION_SIZE=${MINION_SIZE:-'$4'}/g' ./kubernetes/cluster/aws/config-default.sh
        sed -i 's/NUM_MINIONS=${NUM_MINIONS:-4}/NUM_MINIONS=${NUM_MINIONS:-'$5'}/g' ./kubernetes/cluster/aws/config-default.sh
        sed -i 's/AWS_S3_REGION=${AWS_S3_REGION:-us-east-1}/AWS_S3_REGION=${AWS_S3_REGION:-'$2'}}/g' ./kubernetes/cluster/aws/config-default.sh
        #sed -i 's/string,random; print ""/string,random; print (""/g' ./kubernetes/cluster/common.sh
        #sed -i 's/for _ in range(16))/for _ in range(16)))/g' ./kubernetes/cluster/common.sh
        echo "Alteracao de parametros concluida"
        export KUBERNETES_PROVIDER=aws
        bash ./kubernetes/cluster/kube-up.sh
    ;;
    
    GCP|gcp)
        echo "Instalando cluster Kubernetes no GCP"
        echo "Alterando parametros do cluster zona='$2' master_size='$3' minion_size='$4' e nr_workers='$5'"
        sed -i 's/ZONE=${KUBE_GCE_ZONE:-us-central1-b}/ZONE=${KUBE_GCE_ZONE:-'$2'}/g' ./kubernetes/cluster/gce/config-default.sh
        sed -i 's/MASTER_SIZE=${MASTER_SIZE:-n1-standard-1}/MASTER_SIZE=${MASTER_SIZE:-'$3'}/g' ./kubernetes/cluster/gce/config-default.sh
        sed -i 's/MINION_SIZE=${MINION_SIZE:-n1-standard-1}/MINION_SIZE=${MINION_SIZE:-'$4'}/g' ./kubernetes/cluster/gce/config-default.sh
        sed -i 's/NUM_MINIONS=${NUM_MINIONS:-4}/NUM_MINIONS=${NUM_MINIONS:-'$5'}/g' ./kubernetes/cluster/gce/config-default.sh
        sed -i 's/AWS_S3_REGION=${AWS_S3_REGION:-us-east-1}/AWS_S3_REGION=${AWS_S3_REGION:-'$2'}}/g' ./kubernetes/cluster/gce/config-default.sh
        #sed -i 's/string,random; print ""/string,random; print (""/g' ./kubernetes/cluster/common.sh
        #sed -i 's/for _ in range(16))/for _ in range(16)))/g' ./kubernetes/cluster/common.sh
        echo "Alteracao de parametros concluida"

        export KUBERNETES_PROVIDER=gce
        bash ./kubernetes/cluster/kube-up.sh
    ;;
    *)
        echo "Opção inválida"
    ;;
esac

