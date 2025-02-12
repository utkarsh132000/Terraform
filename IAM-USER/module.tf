module "iam" {
  source      = "./modules/iam"
  user_name   = "apple"
  role_name   = "orange"
  policy_name = "papaya"
  groups_name  = "chiku"
}