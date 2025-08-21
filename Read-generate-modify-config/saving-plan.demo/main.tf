# Demo: Saving terraform plan to new file.
    # Commands used are:
        # terraform plan -out plan.infra
        # terraform apply infra.plan or terraform apply "infra.plan"
            # This means whenever we are going to replace old file with new file, new file along with 
            # it's content will not be created since we are applying "apply" operation on saved plan

resource "local_file" "demo" {
    # filename = "sample.txt"                                                                 # Initial file
    # content = "This is a sample file which will be created by local_file resource block."   # Initial content
  filename = "new.txt"               # New file 
  content  = "This is a new content" # New content
}