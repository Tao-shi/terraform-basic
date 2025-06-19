# moved {
#   from = aws_instance.web_server
#   to = aws_instance.web_server1
# }

# resource "aws_instance" "web_server1" {
#   subnet_id = var.subnet_id
#   count         = var.instance_count
#   ami           = var.ami
#   instance_type = var.instance_type
#   key_name               = var.priv_key_name
#   vpc_security_group_ids = var.vpc_security_group_ids

#     tags = {
#     Name = "${var.instance_name}-${count.index + 1}"
#   }
# }

resource "aws_instance" "web_server" {
  subnet_id = var.subnet_id
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name               = var.priv_key_name
  vpc_security_group_ids = var.vpc_security_group_ids

# #   user_data = <<-EOF
# #                   #!/bin/bash
# #                   sudo apt-get update
# #                   sudo apt-get install -y nginx
# #                   sudo systemctl start nginx
# #                   sudo systemctl enable engix
# #                   EOF

#   # provisioner "remote-exec" {
#   #   inline = [
#   #     "sudo apt update -y",
#   #     "sudo apt install -y nginx",
#   #     "sudo systemctl start nginx",
#   #     "sudo systemctl enable nginx"
#   #   ]
#   # }

#   # connection {
#   #   type        = "ssh"
#   #   user        = "ubuntu"
#   #   private_key = file("~/Us-East-KP.pem")
#   #   host        = self.public_ip
#   # }

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }
}