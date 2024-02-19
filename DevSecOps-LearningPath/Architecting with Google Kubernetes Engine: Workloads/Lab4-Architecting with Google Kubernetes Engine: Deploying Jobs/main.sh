# Based on: https://www.cloudskillsboost.google/course_sessions/6464552/labs/451025
# There is a container that prints PI to 2000 digits
# We will deploy a job with this container and check the PI with 2000 digits in
# logs of the created pod for the job

export my_zone=us-west1-c
export my_cluster=standard-cluster-1

source <(kubectl completion bash)

gcloud container clusters get-credentials $my_cluster --zone $my_zone


# ============================================================================
# ============================================================================
# =========================== DEPLOY GKE JOB =================================
# ============================================================================
# ============================================================================

# create example-job.yaml with following content
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  # Unique key of the Job instance
  name: example-job
spec:
  template:
    metadata:
      name: example-job
    spec:
      containers:
      - name: pi
        image: perl:5.34
        command: ["perl"]
        args: ["-Mbignum=bpi", "-wle", "print bpi(2000)"]
      # Do not restart containers after they exit
      restartPolicy: Never
```

# create job with this
kubectl apply -f example-job.yaml

# describe job
kubectl describe job example-job

# get all pods including the pods for the job
kubectl get pods


# list all the jobs
kubectl get jobs

# retrive the log of the pods for the job
kubect logs [POD-ID]
# this command will show the log and PI number which is implemented in the container


# to delete a job
kubectl delete job example-job




# ============================================================================
# ============================================================================
# ========================= DEPLOY GKE CronJob ===============================
# ============================================================================
# ============================================================================

# create example-cronjob.yaml with following content
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox
            args:
            - /bin/sh
            - -c
            - date; echo "Hello, World!"
          restartPolicy: OnFailure
```



