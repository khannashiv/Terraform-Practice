# Demo: Saving terraform plan to new file.

    # Create a infra first using terraform.
    # for example: write main.tf >> terraform plan >> terraform apply >> After this create infra.plan
    # Make changes to main.tf >> do terraform apply "infra.plan" >> New chnages done under main.tf will
    #  not take effect

    # Commands used are:
        # terraform plan -out plan.infra
        # terraform apply infra.plan or terraform apply "infra.plan"
            # This means whenever we are going to replace old file with new file, new file along with 
            # it's content will not be (created / updated) since we are applying "apply" operation on saved plan
        # terraform show "infra.plan"       ---> To view the content of infra.plan file since this is a binary file, we won't able to see content of this file on VS code.
        # terraform show -json infra.plan   ---> To see ouput in json format
        # https://jsonformatter.org/        ---> Online json formatter
        # As part of best practices, prefer to install jq natively on your system
        # terraform show -json "infra.plan" | jq

resource "local_file" "demo" {
    # filename = "sample.txt"                                                                 # Initial file
    # content = "This is a sample file which will be created by local_file resource block."   # Initial content
  filename = "new.txt"               # New file 
  content  = "This is a new content" # New content
}