export my_zone=us-central1-a
export my_cluster=standard-cluster-1


# enable bash completion for kubect
source <(kubectl completion bash)

# create a K8 cluster
gcloud container clusters create $my_cluster --num-nodes 3 --zone $my_zone --enable-ip-alias

# authenticate kubectl to the K8 cluster
gcloud container clusters get-credentials $my_cluster --zone $my_zone

# clond repository that has some K8 manifest yaml files
git clone https://github.com/GoogleCloudPlatform/training-data-analyst
ln -s ~/training-data-analyst/courses/ak8s/v1.1 ~/ak8s
cd ~/ak8s/Deployments/

# in the folder look at the nginx-deployment.yaml file
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```

# create deployment
kubectl apply -f ./nginx-deployment.yaml

# get deployments
kubectl get deployments

# scale the pods 
kubectl scale --replicas=3 deployment nginx-deployment


# rollout a deployment
# A deployment's rollout is triggered if and only if the deployment's Pod template (that is, .spec.template) is changed, 
# for example, if the labels or container images of the template are updated. 
# Other updates, such as scaling the deployment, do not trigger a rollout.
kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.9.1 --record
# view the status of the rollout
kubectl rollout status deployment.v1.apps/nginx-deployment
# see history of rollouts
kubectl rollout history deployment nginx-deployment
# rollback to previous version of deployment
kubectl rollout undo deployments nginx-deployment
# view rollout history
kubectl rollout history deployment nginx-deployment
# show details of the update history
kubectl rollout history deployment/nginx-deployment --revision=3


# look at the service-nginx.yaml file
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx
spec:
  type: LoadBalancer
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 60000
    targetPort: 80
```
#This will deploy a load balacner that will distribute TCP traffic on port 60000
#to port 80 of any of the containers that have the label app:nginx
kubectl apply -f ./service-nginx.yaml


# Canary deployment
# in canary-nginx.yaml we create anthor deployment but with ths same app: nginx label.
# so that the service will distribute some of the traffic to pods related to this deployment.
# this is useful to assess risk of new deployment by distributing some of the traffic to
# new deployment and keeping old deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-canary
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
        track: canary
        Version: 1.9.1
    spec:
      containers:
      - name: nginx
        image: nginx:1.9.1
        ports:
        - containerPort: 80
```
kubectl apply -f nginx-canary.yaml


# the problem with Canary deployment is that each time the load balancer can send
# traffic to normal or canary pod
# in order to prevent possible problem, especially if there are major changes
# in the pods of Canary relative to normal
# then you can use sessionAffinity: ClientIP to use client ip in first request
# to determine which pods should be used for subsequent requests (servic-nginx.yaml)
```
apiVersion: v1
kind: Service
metadata:
  name: nginx
spec:
  type: LoadBalancer
  sessionAffinity: ClientIP
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 60000
    targetPort: 80
```