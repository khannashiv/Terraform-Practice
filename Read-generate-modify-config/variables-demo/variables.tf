variable "vpn_ip" {
  
    default     = "1.2.3.4/32"
    type        = string
    description = "This is VPN Server IP address."
}

variable app_port{

    default     = 8080
    type        = number
    description = "This is my application port."

}

variable web_port{

    default     = 80
    type        = number
    description = "This is my static website port."

}