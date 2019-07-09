#Start Minikube

minikube delete

minikube start --vm-driver hyperv --hyperv-virtual-switch "Primary Virtual Switch"

kubectl get pods -n kube-system

minikube dashboard

eval $(minikube docker-env)

& minikube docker-env | Invoke-Expression



# gateway_svc Service

docker build ./gateway_svc -t gateway

kubectl apply -f gateway_svc/gateway-deployment.yaml

kubectl apply -f gateway_svc/gateway-service.yaml


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

#http://192.168.1.101:30479/api/v1/hey

# Test
curl $(minikube service gateway-service --url)/api/v1/book/1 -H "authorization: ASUPERSECUREAUTTHTOKEN"









