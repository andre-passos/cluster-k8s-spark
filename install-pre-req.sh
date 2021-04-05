#!/bin/bash

#function install-pre-req() {
#    if [$1 -eq aws] then
#        echo "Install AWS Pre-Reqs"  
#    elif [$1 -eq azure] then
#        echo "Install Azure Pre-Reqs"
#    else [$1 -eq gcp]
#        echo "Install GCP Pre-Reqs"
#    fi
#}

case "$1" in
    aws|AWS|"")
        echo "Instalando AWS Pre-Reqs"
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
    ;;
   
    GCP|gcp)
        echo "Install GCP Pre-Reqs"
        curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-334.0.0-linux-x86_64.tar.gz
        tar -zxvf google-cloud-sdk-334.0.0-linux-x86_64.tar.gz
        sh ./google-cloud-sdk/install.sh
        sh ./google-cloud-sdk/bin/gcloud init

    ;;
    *)
        echo "Opção inválida"
    ;;
esac

wget https://storage.googleapis.com/kubernetes-release/release/v1.20.0/kubernetes.tar.gz
tar -xzvf kubernetes.tar.gz
