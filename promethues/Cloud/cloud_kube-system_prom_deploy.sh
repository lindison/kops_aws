kubectl create -f prometheus-configmap-1.yaml --namespace kube-system
kubectl create -f prometheus-deployment.yaml --namespace kube-system
kubectl get pods --namespace kube-system
kubectl get services --namespace kube-system
kubectl replace -f prometheus-configmap-2.yaml --namespace kube-system
kubectl create -f node-exporter.yaml --namespace kube-system
kubectl get pods --namespace kube-system
kubectl get services --namespace kube-system
kubectl create -f grafana-service.yaml --namespace kube-system
kubectl create -f grafana-deployment.yaml --namespace kube-system
kubectl get pods --namespace kube-system
kubectl get services --namespace kube-system
