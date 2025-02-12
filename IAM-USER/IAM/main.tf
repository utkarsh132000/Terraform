resource "aws_iam_user" "shu" {
  name = var.user_name
}

resource "aws_iam_role" "T-role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "T-pol" {
  name = var.policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group" "G-iam" {
  name = var.groups_name
}

# Attach policy to the user
resource "aws_iam_user_policy_attachment" "shub" {
  user       = aws_iam_user.shu.name
  policy_arn = aws_iam_policy.T-pol.arn
}
# Attach policy to the role
resource "aws_iam_role_policy_attachment" "role-policy" {
  role       = aws_iam_role.T-role.name
  policy_arn = aws_iam_policy.T-pol.arn
}

# Attach policy to the group
resource "aws_iam_group_policy_attachment" "Attak" {
  group      = aws_iam_group.G-iam.name
  policy_arn = aws_iam_policy.T-pol.arn
}

# Add user to the group
resource "aws_iam_group_membership" "tai" {
  name  = "bhai"
  users = [aws_iam_user.shu.name]
  group = aws_iam_group.G-iam.name
}
