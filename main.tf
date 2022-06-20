



data "hcp_packer_iteration" "ubuntu" {
  bucket_name = "demo"
  channel     = "front-end"
}

data "hcp_packer_image" "eu-central-1" {
  bucket_name    = "demo"
  iteration_id   = data.hcp_packer_iteration.ubuntu.ulid
  cloud_provider = "aws"
  region         = "eu-central-1"
}

resource "aws_instance" "webapp" {
  ami                         = data.hcp_packer_image.eu-central-1.cloud_image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.default.id
  vpc_security_group_ids      = [aws_security_group.allow_tcp_ssh.id]

  tags = {
    Name = "lomar-apache-instance"
    app  = "webapp"
  }
}

output "aws_instance" {
  value = aws_instance.webapp.public_ip
}