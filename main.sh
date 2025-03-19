helm uninstall community-operator --namespace itmo 
helm uninstall itmo --namespace itmo 
kubectl delete all --all -n itmo

helm repo add mongodb https://mongodb.github.io/helm-charts
helm install community-operator mongodb/community-operator --namespace itmo --create-namespace
kubectl apply -f ../mongo.yaml --namespace itmo
helm install itmo . --namespace itmo 


kubectl exec -it mongodb-0 -n itmo -- mongosh -u my-user -p "<your-password-here>" --eval 'db = db.getSiblingDB("auth");db.users.insertOne({"full_name": "Valerii Lebedev", "username": "sudya", "password": "555"});'