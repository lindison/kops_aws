# Kubernetes Deployment to AWS
This repo contains the source files for Building out a Kubernetes Cluster in AWS using KOPS. 

More info on KOPS can be found at this [link](https://github.com/kubernetes/kops)

Populate names with the names of the clusters, user, etc, typically, email name or user account name (if building for humans). NOTE: it must be unique!  

To deploy the Kubernetes clusters, run the following command
```commandline
build_k8s.sh --dns-zone "<your_route53_domain>" --state-store "s3://<your_s3_bucket>"
```
 - NOTE: This will also automatically generate an Ansible inventory.ini file.  

To deploy a monitoring service and the Kubernetes dashboard, run the `services.sh` script. 

If Ansible is installed, it can be used to deploy the "services" to the Kubernetes Clusters; however, the participants can just as easily do this. 

To delete the environment, run
```commandline
cleanup_k8s.sh --dns-zone "your_route53_domain>" 
```

In order for this to work, the following requirements must be met by the individual building the labs.  

1) KOPS installed on machine where build is being run from  
2) Fully functional AWS Account  
3) Fully functional AWS Route 53 DNS hosted domain  
4) kubectl  

