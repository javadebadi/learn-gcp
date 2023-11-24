module "git_config" {
  source = "./modules/git"
  git_user_email = var.git_config.username
  git_user_username = var.git_config.email
}