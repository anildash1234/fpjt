#-------------------ArgoCD----------------
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#----------------Grafana Prometheus-------------------
helm repo add stable https://charts.helm.sh/stable
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
kubectl create namespace Prometheus
helm install stable prometheus-community/kube-prometheus-stack -n prometheus

#prometheus elb url:9090
#grafana elb url/login
#to login to grafana
#kubectl get secret --namespace prometheus stable-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


#----------------EBS CSI Driver for Kubernetes volumes 
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update

#install aws ebs driver to kubernets 
helm upgrade --install aws-ebs-csi-driver --namespace kube-system aws-ebs-csi-driver/aws-ebs-csi-driver
