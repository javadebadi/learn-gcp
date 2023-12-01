COMMIT_ID="$(git rev-parse --short=7 HEAD)"
terraform apply -var container_tag_name=$COMMIT_ID

cd ~ && gcloud source repos clone hello-cloudbuild-env && cd ~/hello-cloudbuild-env && git checkout -b production

cd ~/hello-cloudbuild-env && cp ~/hello-cloudbuild-app/cloudbuild-delivery.yaml ~/hello-cloudbuild-env/cloudbuild.yaml && git add . && git commit -m "Create cloudbuild.yaml for deployment"

git checkout -b candidate && git push origin production && git push origin candidate