kubectl create -f prometheus-configmap-1.yaml
kubectl create -f prometheus-deployment.yaml
kubectl get pods
kubectl get services
kubectl replace -f prometheus-configmap-2.yaml
kubectl create -f node-exporter.yaml
kubectl get pods
kubectl get services
kubectl create -f grafana-service.yaml
kubectl create -f grafana-deployment.yaml
kubectl get pods
kubectl get services
