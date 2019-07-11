#Start Minikube

minikube delete

minikube status

minikube update-context


minikube start --vm-driver hyperv --hyperv-virtual-switch "Primary Virtual Switch"

kubectl get pods -n kube-system

minikube dashboard

eval $(minikube docker-env)

& minikube docker-env | Invoke-Expression



# gateway_svc Service

docker build ./gateway_svc -t gateway

kubectl apply -f gateway_svc/gateway-deployment.yaml

kubectl apply -f gateway_svc/gateway-service.yaml

kubectl delete -f gateway_svc/gateway-deployment.yaml


kubectl delete deployment gateway-deployment   


# auth_svc Service

docker build ./auth_svc -t auth

kubectl apply -f auth_svc/auth-deployment.yaml

kubectl apply -f auth_svc/auth-service.yaml



# Book Service

docker build ./books_svc -t books

kubectl apply -f books_svc/books-deployment.yaml

kubectl apply -f books_svc/books-service.yaml

curl $(minikube service books-service --url)/api/v1/book/1

#Get Pods

kubectl get pods -o=custom-columns=NAME:.metadata.name,IP:.status.podIP

#Get Service
kubectl get services -o=custom-columns=NAME:.metadata.name,IP:.spec.clusterIP

#NodePort
minikube status
minikube service gateway-service --url

minikube dashboard

kubectl get svc --all-namespaces

#http://192.168.1.103:30479/api/v1/hey

# Test
curl $(minikube service gateway-service --url)/api/v1/book/1 -H "authorization: ASUPERSECUREAUTTHTOKEN"


# Prom grafane

#Install HELM
choco install kubernetes-helm -y

#Install Thriller
helm init

#Verify 
helm version

#Update the Repo
helm repo update

#Install Service Monitor
helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring

kubectl get pods  -n monitoring

#Port forward to view on prometheus dashboard
kubectl port-forward -n monitoring prometheus-prometheus-operator-prometheus-0 9090






