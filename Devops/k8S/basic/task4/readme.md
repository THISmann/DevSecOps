

- Utiliser BusyBox	
kubectl run busybox --image=busybox --restart=Never -- sleep 3600 puis kubectl exec -it busybox -- ping my-nginx-service

- Installer ping dans Nginx
kubectl exec -it my-nginx -- sh puis apt update && apt install -y iputils-ping

- Tester DNS avec nslookup	
kubectl exec -it my-nginx -- sh puis nslookup my-nginx-service

- Tester HTTP avec curl	
kubectl exec -it my-nginx -- curl -I http://my-nginx-service

- create a deployment 
kubectl create deployment nginx --image=nginx

deployment.apps/nginx created

curl http://$(minikube ip):30080

kubectl scale deployment nginx-deployment --replicas=3

kubectl rollout undo deployment nginx-deployment

 kubectl rollout history deployment nginx-deployment

 kubectl get rs -l app=nginx-app

 ![alt text](image.png)
 ![alt text](image-1.png)
 ![alt text](image-2.png)
 ![alt text](image-3.png)
 ![alt text](image-4.png)
 ![alt text](image-5.png)
 ![alt text](image-6.png)
 ![alt text](image-7.png)
 ![alt text](image-8.png)
 ![alt text](image-9.png)
 ![alt text](image-10.png)
 ![alt text](image-11.png)
 ![alt text](image-12.png)
 ![alt text](image-13.png)