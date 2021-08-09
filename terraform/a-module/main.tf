data "aws_caller_identity" "this" {}

resource "aws_iam_role" "this" {
  name_prefix               = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root"
        }
      },
    ]
  })
}

data "aws_iam_policy_document" "this_pass_role" {
  statement {
    sid = "passTheRole"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      aws_iam_role.this.arn,
    ]
  }
}

resource "aws_iam_policy" "this" {
  name_prefix               = var.name
  policy = data.aws_iam_policy_document.this_pass_role.json

}

resource "aws_iam_group" "this" {
  name = var.name
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_user" "this" {
  name = var.name
  path = "/"
}

resource "aws_iam_user_group_membership" "this" {
  user = aws_iam_user.this.name

  groups = [
    aws_iam_group.this.name
  ]
}