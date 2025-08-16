variable ami {

    default     = "ami-1234"
    type        = string
    description = "This is the default value for ami if value does not exist in tfvars in that case value of ami will be picked from here."
}