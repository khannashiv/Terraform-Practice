module "custom_ec2_local" {

  # Relative-Path not working
  # source = "../../Read-generate-modify-config/graph.demo/"

  # Absolute Path: D:\Git-repository\Terraform-Practice\Read-generate-modify-config\graph-demo
  
  # Absolute path working   
  source = "D:/Git-repository/Terraform-Practice/Read-generate-modify-config/graph-demo"
}