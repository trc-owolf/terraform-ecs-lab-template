resource "aws_security_group" "web" {
  name_prefix = "web"

  vpc_id = var.vpc_id

  description = "Allow access to the server from the web"
  tags = {
    Name = "web"
  }
}

resource "aws_eip" "static-ip" {
}

resource "aws_security_group_rule" "ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] //Challenge: Add your own IP (or your Cloud9 public IP here)
  security_group_id = aws_security_group.web.id
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t3.micro"

  subnet_id = var.subnet

  #user_data = file("./scripts/bootstrap_apache.sh")


  user_data = <<EOF
Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
# Install Apache Web Server
yum install -y httpd
echo "Hello Captain!" > /var/www/html/index.html
# Turn on web server
chkconfig httpd on
service httpd start
  EOF

  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "${var.technical_contact}'s Webserver"
  }
}

resource "aws_eip_association" "eip-assoc" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.static-ip.id
}
