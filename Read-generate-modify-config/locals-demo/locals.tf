provider "aws" {
  region = "us-east-1"
}

locals {
  my_local_sg = {                                                                 # Any name can be given to locals block (local values).
    name = "firewall-sg"                                                          # Here in this case name is given as: my_local_sg
    # Creation_date = formatdate("DD-MM-YYYY", timestamp())                       # Working.
    creation_date = "Time stamp is ${formatdate("DD-MM-YYYY", timestamp())}"      # Working.
  }
}

resource "aws_security_group" "sg-1" {
  name = "app-security-group"
  tags = local.my_local_sg                      # Calling locals block (local values block) using local.
}

resource "aws_security_group" "sg-2" {
  name = "db-security-group"
  tags = local.my_local_sg                      # Calling locals block (local values block) using local.
}
