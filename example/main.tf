data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "test_instance" {
  source        = "github.com/david-kerins/terraform-aws-in-depth//modules/ec2_instance"
  subnet_id     = var.subnet_id
  instance_type = "t3.micro"
}
output "aws_instance_arn" {
  value = module.test_instance.aws_instance_arn
}
