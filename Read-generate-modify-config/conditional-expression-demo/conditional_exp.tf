provider "aws" {
  region = var.region
}

# Test 1: Conditional Xpression.

resource "aws_instance" "web" {
  ami = "ami-0de716d6197524dd9"                                         # We can also variablize this.
  instance_type = var.env == "development" ? "t2.micro" : "t2.large"    # equal to comparision operator.
}

# Test 2: Conditional Xpression.

resource "aws_instance" "web_1" {
    ami = "ami-0de716d6197524dd9"
    instance_type = var.env != "development" ? "t3.micro" : "t3.large" # not equal to comparision operator.
}

# Test 3: Conditional Xpression with multiple variables.

resource "aws_instance" "web_2" {
    ami = "ami-0de716d6197524dd9"
    instance_type = var.region == "us-east-1" && var.env == "QA" ? "t4.micro" : "t4.large"
}

# Test 4: Conditional Xpression with multiple variables.

resource "aws_instance" "web_3" {
    ami = "ami-0de716d6197524dd9"
    instance_type = var.region == "us-east-1" && var.environment[2] == "QA" ? "t5.micro" : "t5.large"
}

# Test 5: Conditional Xpression with multiple variables.

resource "aws_instance" "web_4" {
    ami = "ami-0de716d6197524dd9"
    instance_type = var.region == "us-east-1" && var.demo["env_2"] == "UAT" ? "t6.micro" : "t6.large"
}
