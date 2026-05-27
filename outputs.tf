output "aws_instance_arn" {
  description = "The AWS Resource Name for the instance."
  value       = aws_instance.hello_world.arn
}

output "aws_instance_ip" {
  description = "The IP Address for the private network interface on the instance."
  value       = aws_instance.hello_world.private_ip
}

output "aws_instance" {
  description = "The entire instance resource."
  value = {
    id        = aws_instance.hello_world.id
    arn       = aws_instance.hello_world.arn
    public_ip = aws_instance.hello_world.public_ip
  }
}
