module "git-module" {
  source = "github.com/khannashiv/Terraform-Practice/" # This will look for terraform files (i.e. .tf files) 
  # which are present at the root of the repository.Hence we have created sample main.tf at the root of
  # the repository.

  # Initially we have tested by passing static values for region, instance_type & ami under main.tf which is
  # sitting at the root of the repository.

  # Now we are making use of variables such that we are replacing static values under main.tf with variables.
  ami           = "ami-064fad1cd2e859c98"
  region        = "ap-south-1"
  instance_type = "t2.micro"
}