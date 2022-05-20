# 1. Deploy application services
## 1.1. Mongodb
```
kubectl apply -f mongo-statefulset.yaml
kubectl apply -f mongo-service.yaml
```
## 1.2. Book 
```
kubectl apply -f books-deployment.yaml
kubectl apply -f books-service.yaml
```
## 1.3. Order
```
kubectl apply -f orders-deployment.yaml
kubectl apply -f orders-service.yaml
```
## 1.4. Customer
```
kubectl apply -f customers-deployment.yaml
kubectl apply -f customers-service.yaml
```

# 2. Deploy Ingress
```
kubectl apply -f app-ingress.yaml
```