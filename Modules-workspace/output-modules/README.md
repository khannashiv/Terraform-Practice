**Practice Modules**

- Here please note under output-modules folder we have created two folders
    - modules ( This refer to place where child modules are created and stored)
    - teams ( This refer to place where we are calling the modules and passing the variables. Hence this is called as root module)
    - Also note we can define provider block in root module only and it will be inherited by child modules. Hence we have defined provider in team-a folder's module.tf file and removed from ec2-module's ec2.tf file.