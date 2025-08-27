provider "aws" {
  region = "us-east-1"
}

import {
  id ="sg-02b185868a6bd8ca5"
  to = aws_security_group.web-sg
}