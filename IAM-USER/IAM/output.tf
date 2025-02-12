output "user_name" {
  value = aws_iam_user.shu.name

}
output "role_arn" {
  value = aws_iam_role.T-role.arn
}
output "policy_arn" {
  value = aws_iam_policy.T-pol.arn

}
output "groups_name" {
  value = aws_iam_group.G-iam.name

}