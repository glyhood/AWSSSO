data "aws_ssoadmin_instances" "identity_provider(e.g. okta)" {}

data "aws_ssoadmin_permission_set" "AWSAdministratorAccess" {
  instance_arn = tolist(data.aws_ssoadmin_instances.okta.arns)[0]
  name         = "AWSAdministratorAccess"
}

resource "aws_ssoadmin_permission_set" "DevOps_DevEnv" {
  instance_arn = tolist(data.aws_ssoadmin_instances.okta.arns)[0]
  name         = "DevOps_DevEnv"
  description  = "Provides access for members of the DevOps team to the development env"
  tags = {
    Environment = "Development"
    Team        = "DevOps"
  }
}

resource "aws_ssoadmin_permission_set" "DevOps_ProdEnv" {
  instance_arn = tolist(data.aws_ssoadmin_instances.okta.arns)[0]
  name         = "DevOps_ProdEnv"
  description  = "Provides access for members of the DevOps team to the production env"
  tags = {
    Environment = "Production"
    Team        = "DevOps"
  }
}