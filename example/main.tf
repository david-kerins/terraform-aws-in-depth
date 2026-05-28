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
  source                 = "github.com/david-kerins/terraform-aws-in-depth//modules/ec2_instance"
  instance_count         = 2
  subnet_id              = data.aws_subnets.default.ids[0]
  instance_type          = "t3.micro"
  name_prefix            = "ddk"
  enable_systems_manager = true
  #subnet_id    = var.subnet_id

  tags = {
    "BillingGroup" = "mygroup"
  }
}

# output "aws_instance_arn" {
#   value = module.test_instance.
# }

output "aws_subnet_id" {
  value = data.aws_subnets.default.ids[0]
}
