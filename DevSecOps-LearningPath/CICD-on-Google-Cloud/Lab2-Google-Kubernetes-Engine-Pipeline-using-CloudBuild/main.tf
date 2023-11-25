module "git_config" {
  source = "./modules/git"
  git_user_email = var.git_config.username
  git_user_username = var.git_config.email
}

module "app_google_source_repo" {
    source = "./modules/git_google_source"
    repo_name = var.app_google_source_repo_name
}

module "env_google_source_repo" {
    source = "./modules/git_google_source"
    repo_name = var.env_google_source_repo_name
}