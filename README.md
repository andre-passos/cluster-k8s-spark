# Instalacao de um Cluster Kubernetes na Nuvem AWS|GCP para execução de jobs Spark

## PRE_REQS
Se você ainda nao instalou os pre-reqs para a nuvem desejada, rode o comando abaixo informando qual a nuvem como parametro:

Exemplo:

```
# sudo sh install-pre-req.sh aws|gcp
```
Após a execução do script, voce irá ja ter baixado o pacote instalador do kubernetes. Nele voce irá configurar os parametros necessarios para subir seu ambiente.

Após realizada a instalacao dos pré-reqs, voce precisará configurar a CLI da nuvem, para isso, crie as entradas de autenticacao na nuvem desejada conforme padrao de cada CLI:

AWS: 
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html

GCP: https://cloud.google.com/sdk/docs/authorizing



## Configuração do cluster Kubernetes

### Para a instalacao na nuvem desejada, voce precisará informar alguns parametros ao chamar o script de instalação, conforme abaixo:

```
sudo sh install-kube-spark.sh $1 $2 $3 $4 $5
```
Sendo cada parametro informado:

$1 = Nuvem a ser instalada. Ex.: aws ou gcp

$2 = ZONE= # Aqui voce especifica qual a zone onde o cluster irá rodar

$3 = MASTER_SIZE= # aqui o tamanho da maquina virtual do Master node

$4 = MINION_SIZE= # aqui o tamanho da maquina virtual do Worker node

$5 = NUM_MINIONS= # Aqui o nr de workers que irão rodar no cluster

Exemplo de chamada do script:
```
sudo sh install-kube-spark.sh aws us-east-1 t2.micro t2.micro 3
``` 

### A partir desse ponto voce deve estar com o cluster instalado. Agora iremos configurar os nós do Spark para executar o job desejado 

