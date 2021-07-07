data "aws_identitystore_group" "DevOps" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.okta.identity_store_ids)[0]

  filter {
    attribute_path  = "DisplayName"
    attribute_value = "PG_AWSSS0_DEVOPS"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "DevOps_DevEnv_Policy" {
  instance_arn       = aws_ssoadmin_permission_set.DevOps_DevEnv.instance_arn
  count              = length(var.DevOps_DevEnv_policy_arn)
  managed_policy_arn = var.DevOps_DevEnv_policy_arn[count.index]
  permission_set_arn = aws_ssoadmin_permission_set.DevOps_DevEnv.arn
}

resource "aws_ssoadmin_account_assignment" "Admin_DevEnv" {
  instance_arn       = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_development_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "Admin_ProdEnv" {
  instance_arn       = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_production_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "Admin_MasterEnv" {
  instance_arn       = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_master_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "Admin_AuditEnv" {
  instance_arn       = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_audit_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "Admin_logarchiveEnv" {
  instance_arn       = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.AWSAdministratorAccess.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_logarchive_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "DevOps_DevEnv" {
  instance_arn       = aws_ssoadmin_permission_set.DevOps_DevEnv.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.DevOps_DevEnv.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_development_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "DevOps_ProdEnv" {
  instance_arn       = aws_ssoadmin_permission_set.DevOps_ProdEnv.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.DevOps_ProdEnv.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_production_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "DevOps_Engineer_DevEnv" {
  instance_arn       = aws_ssoadmin_permission_set.DevOps_DevEnv.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.Engineer_DevEnv.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_development_account_id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "DevOps_Engineer_ProdEnv" {
  instance_arn       = aws_ssoadmin_permission_set.DevOps_ProdEnv.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.Engineer_ProdEnv.arn

  principal_id   = data.aws_identitystore_group.DevOps.group_id
  principal_type = "GROUP"

  target_id   = var.company_production_account_id
  target_type = "AWS_ACCOUNT"
}