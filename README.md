# StakaterKubeHelmLogging
A Stack to Deploy Logging Apps on Kubernetes Cluster via Helm Charts i.e. Elasticsearch, Fluentd, Kibana etc.

# How to deploy manually
0. Replace all variables mentioned below in the files/folders according to the cloud provider 
1. Make sure `kubectl` is configured correctly with your kubernetes cluster. i.e. `~/.kube/config`
2. Create a new namespace in the cluster.
```
kubectl create namespace logging
```
3. Switch directory to `manifests` folder
```
cd manifests
```
4. Run the following command
```
kubectl apply -f . -n logging
```
4. After this command is executed successfully switch directory to `aws` if you want to deploy on Aamazon Web Services (AWS) or `azure` if you want to deploy on Microsoft Azure Cloud Platform.
```
cd [aws|azure]/
```
6. Run the following command
```
kubectl apply -f . -n logging
```
7. It will take 3-4 minutes for kubernetes to completely reflect all the changes on the dasboard.

# Variables to replace
REPLACE_PROVIDER: azure,aws,ibm etc.
REPLACE_DOMAIN_NAME: Domain name to expose applications e.g stakater.com.
REPLACE_NAMESPACE: Namespace to deploy in Kubernetes
REPLACE_STORAGE_TYPE: `gp2` for AWS, `Standard_LRS` for Azure
REPLACE_BASE64_CA_CERT_STRING: base64 string for ca.crt for sealed secrets
REPLACE_BASE64_TLS_CERT_STRING: base64 string for tls.crt for sealed secrets
REPLACE_BASE64_TLS_KEY_STRING: base64 string for tls.key for sealed secrets
REPLACE_PROVISIONER: `aws-ebs` for AWS, `azure-disk` for Azure

## Changes For Azure

TLS is terminated on the pods so we need to provide additional annotations in xposer for TLS options
```
        config.xposer.stakater.com/TLS: 'true'
        config.xposer.stakater.com/TLSSecretNameTemplate: 'tls-cert'
```