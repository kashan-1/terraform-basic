variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "MyServer"
}

variable "key_name" {
  type    = string
  default = "ssh_key"
}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4095
}
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}
output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}