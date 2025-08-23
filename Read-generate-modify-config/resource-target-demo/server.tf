resource "aws_instance" "web"{
    instance_type = "t2.micro"
    ami = "ami-0360c520857e3138f"
}