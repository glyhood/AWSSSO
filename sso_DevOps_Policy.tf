variable "DevOps_DevEnv_policy_arn" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]
}

data "aws_iam_policy_document" "DevOps_DevEnv_Custom_Policy" {
  statement {
    actions = [
      "ec2:Describe*",
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:Describe*",
      "autoscaling:Describe*",
      "cloudformation:*"
    ]

    resources = ["*"]
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "DevOps_DevEnv_Custom_Policy" {
  inline_policy      = data.aws_iam_policy_document.DevOps_DevEnv_Custom_Policy.json
  instance_arn       = aws_ssoadmin_permission_set.DevOps_DevEnv.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.DevOps_DevEnv.arn
}

data "aws_iam_policy_document" "DevOps_ProdEnv_Custom_Policy" {
  statement {
    actions = [
      "ec2:Describe*",
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:Describe*",
      "autoscaling:Describe*"
    ]

    resources = ["*"]
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "DevOps_ProdEnv_Custom_Policy" {
  inline_policy      = data.aws_iam_policy_document.DevOps_ProdEnv_Custom_Policy.json
  instance_arn       = aws_ssoadmin_permission_set.DevOps_ProdEnv.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.DevOps_ProdEnv.arn
}