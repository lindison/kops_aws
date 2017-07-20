# kubectl apply -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/route53-mapper/v1.3.0.yml
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.5.0.yaml
# kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/monitoring-standalone/v1.3.0.yaml
kubectl apply --namespace kube-system -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
kubectl create -f https://raw.githubusercontent.com/lindison/kops_aws/master/promethues/prometheus-configmap-1.yaml
kubectl create -f https://raw.githubusercontent.com/lindison/kops_aws/master/promethues/prometheus-deployment.yaml
kubectl replace -f https://raw.githubusercontent.com/lindison/kops_aws/master/promethues/prometheus-configmap-2.yaml
kubectl create -f https://raw.githubusercontent.com/lindison/kops_aws/master/promethues/node-exporter.yaml
kubectl create -f https://raw.githubusercontent.com/lindison/kops_aws/master/promethues/grafana-service.yaml
kubectl create -f https://raw.githubusercontent.com/lindison/kops_aws/master/promethues/grafana-deployment.yaml
