COMMIT_ID="$(git rev-parse --short=7 HEAD)"
terraform apply -var container_tag_name=$COMMIT_ID