export my_zone=us-east4-c
export my_cluster=standard-cluster-1

gcloud container clusters create $my_cluster --num-nodes 3 --zone $my_zone --enable-ip-alias

gcloud container clusters resize $my_cluster --zone $my_zone --num-nodes=4

gcloud container clusters get-credentials $my_cluster --zone $my_zone

kubectl config view

kubectl cluster-info

# get information of current context (current cluster we can connect by kubectl)
kubectl config current-context

# list all cluster contexts
kubectl config get-contexts

# change context to another cluster (should give full name of the GKE cluster)
kubectl config use-context gke_${GOOGLE_CLOUD_PROJECT}_us-east4-c_standard-cluster-1

# see cpu and memory usage of nodes
kubectl top nodes
kubect top pods


# enable bash completion for kubect
source <(kubectl completion bash)


kubectl create deployment --image nginx nginx-1

export my_nginx_pod=[name-of-the-pod]
# add this contenct to ~/text.html
<html> <header><title>This is title</title></header>
<body> Hello world </body>
</html>

# copy file from local machine to pod
kubectl cp ~/test.html $my_nginx_pod:/usr/share/nginx/html/test.html


kubectl expose pod $my_nginx_pod --port 80 --type LoadBalancer

kubectl get services

curl http://[EXTERNAL_IP]/test.html


git clone https://github.com/GoogleCloudPlatform/training-data-analyst
ln -s ~/training-data-analyst/courses/ak8s/v1.1 ~/ak8s
cd ~/ak8s/GKE_Shell/
kubectl apply -f ./new-nginx-pod.yaml

kubectl exec -it new-nginx /bin/bash
apt-get update
apt-get install nano
cd /usr/share/nginx/html
nano test.html
<html> <header><title>This is title</title></header>
<body> Hello world </body>
</html>

# an easier way than to create service to connect to a pod is port-forwarding
kubectl port-forward new-nginx 10081:80
# foreground process -> opne new cloudshell by click on +
curl http://127.0.0.1:10081/test.html

# see logs (open a third tab of cloudshell)
kubectl logs new-nginx -f --timestamps
# see log messages after executing curl again in second tab

