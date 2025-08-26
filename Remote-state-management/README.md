**Reference Docs**

- https://developer.hashicorp.com/terraform/language/backend
- https://developer.hashicorp.com/terraform/language/backend/local
- https://developer.hashicorp.com/terraform/language/backend/s3 
- https://registry.terraform.io/providers/hashicorp/time/0.9.1/docs/resources/sleep 
- https://docs.devnetexperttraining.com/static-docs/Terraform/docs/cli/commands/state/list.html

**Smaple Commands**
- terraform state list
- terraform state show aws_security_group.Dev-SG 
    - Here aws_security_group --> is resource type & Dev-SG --> is resource name. Combination of        resource type & resource name is called as resource address.
- terraform state show aws_vpc_security_group_ingress_rule.inbound_ssh
- terraform state show aws_iam_user.lb[2]
- terraform state show aws_iam_user.lb[0]