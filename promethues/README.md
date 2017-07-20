# Prometheus with Kubernetes and Grafana

This guide will configure [Promethues](https://prometheus.io)  to work with Kubernetes. This guide by no means creates a production monitoring solution for Kubernetes but is a step in showing how a monitoring system would world. [Grafana](https://grafana.net) is also configured to utilize a good opensource dashboarding tool.  

aim of the repos it to show how we can use prometheus with kubernetes and grafana.
the following step will help you to create a kubernetes cluster with [minikube](https://github.com/kubernetes/minikube)
and deploy [prometheus.io](https://prometheus.io) in this cluster. Then deploy and configure
a [Grafana](https://grafana.net) dashboard connected to the prometheus service.

## Kubernetes

To get Kubernetes installed, [minikube](https://github.com/kubernetes/minikube) will be used. For this lab, the single node cluster that minikube creates is fine.  

Download the minikube executable: 

[MacOS](https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-darwin-amd64)   
Alternatively, run the following on the console:  
`curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/`

[Linux](https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-linux-amd64)  
Alternativelty, run the following on the console:  
`curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/`  

[Windows10](https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-windows-amd64.exe)   
Download the minikube binary and rename it to `minikube.exe`  
Place the executable in the following folder:  
`C:\Program Files (x86)\Kubernetes\Minikube\`  

Test:

`minikube version`  
This should return something like the following:  
```shell
minikube version: v0.18.0
```

`which minikube`  
MaxOS/Linux:  
```shell
minikube is /usr/local/bin/minikube  
minikube is /usr/local/bin/minikube  
minikube is /usr/local/bin/minikube  
```
Windows10:  
```shell
/c/Program Files (x86)/Kubernetes/Minikube/minikube
```


### Kubernetes install instructions  
Download Kubernetes, place in correct location /usr/local/bin on Linux/MacOS or C:\Program Files (x86)\Kubernetes\Minikube\ on Windows10.  

Test:  
`kubeectl version` 
This should return something like the following:  
```shell
Client Version: version.Info{Major:"1", Minor:"6", GitVersion:"v1.6.1", GitCommit:"b0b7a323cc5a4a2019b2e9520c21c7830b7f708e", GitTreeState:"clean", BuildDate:"2017-04-03T23:37:53Z", GoVersion:"go1.8", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"6", GitVersion:"v1.6.0", GitCommit:"fff5156092b56e6bd60fff75aad4dc9de6b6ef37", GitTreeState:"dirty", BuildDate:"2017-04-07T20:46:46Z", GoVersion:"go1.7.3", Compiler:"gc", Platform:"linux/amd64"}
```   
   
`which kubectl`  
This should return something like the following:  
MacOS/Linux:  
```shell
kubectl is /usr/local/bin/kubectl  
kubectl is /usr/local/bin/kubectl  
kubectl is /usr/local/bin/kubectl  
```
Windows10:
```shell
/c/Program Files (x86)/Kubernetes/Minikube/kubectl
```

## Windows10 extra steps

In HyperV create a new virtual switch in Virtual Switch Manager. Use the following parameters:  

name: minikube  
External Network (Use the primary network interface)  
Check the box `Allow management operating system to share this network adapter`  
Click `Apply`, once complete, click `OK`  


## Start Minikube 

From the console (iTerm, tty, PowerShell, GitBash, or other), run the following command. This command REQUIRES the correct version of kubectl be both installed and executable. 
`minikube start`  
This will take a few minutes to complete.  

`minikube get nodes`



## Promethues and Grafana Steps

`kubectl create -f prometheus-configmap-1.yaml`  

`kubectl create -f prometheus-deployment.yaml`  

`kubectl get pods`  

`kubectl get services`  

`kubectl replace -f prometheus-configmap-2.yaml`  

`kubectl create -f node-exporter.yaml`  

`kubectl get pods`  

`kubectl get services`  

`kubectl create -f grafana-service.yaml`  

`kubectl create -f grafana-deployment.yaml`   

`kubectl get pods`

`kubectl get services`  
