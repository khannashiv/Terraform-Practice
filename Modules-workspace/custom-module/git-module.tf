module "git-module" {
  source = "github.com/khannashiv/Terraform-Practice/" # This will look for terraform files (i.e. .tf files) 
  # which are present at the root of the repository.Hence we have created sample main.tf at the root of
  # the repository.
  # Initially we have tested by passing static values for region, instance_type & ami
}