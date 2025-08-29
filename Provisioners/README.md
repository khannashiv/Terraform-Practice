**Terrraform Provisioners**
- https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax
- https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec
NOTE: 
- The `local-exec` provisioner is used to execute commands on the machine where Terraform is being run. It is often used for tasks such as running scripts or commands that need to be executed locally after a resource is created or updated.
    - Also upon running terraform destroy for the resources created locally the destroy command will not destroy resources locally created using local-exec provisioner. 
    - M1 : terraform destroy -auto-approve rm -f Server_IP.txt demo.txt

- https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec
- https://developer.hashicorp.com/terraform/language/resources/provisioners/file
- https://developer.hashicorp.com/terraform/language/resources/provisioners/connection
- https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource