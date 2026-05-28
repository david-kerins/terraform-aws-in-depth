data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# variable "subnet_id" {
#   type        = string
#   description = "The Subnet to launch this resource in."
# }

module "test_instance" {
  #subnet_id    = var.subnet_id
  subnet_id     = data.aws_subnets.default.ids[0]
  source        = "github.com/david-kerins/terraform-aws-in-depth//modules/ec2_instance"
  instance_type = "t3.micro"
}
output "aws_instance_arn" {
  value = module.test_instance.aws_instance_arn
}
output "aws_subnet_id" {
  value = data.aws_subnets.default.ids[0]
}
