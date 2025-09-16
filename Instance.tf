resource "aws_instance" "miniproject" {
  ami                    = var.amiID[var.region]
  instance_type          = "t3.micro"
  key_name               = "minipro-key"
  vpc_security_group_ids = [aws_security_group.miniproject_sg.id]
  availability_zone      = var.zone1
  tags = {
    Name    = "Miniproject"
    Project = "Terraform based MiniProject"
  }


  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  connection {
    type        = "ssh"
    user        = var.miniprouser
    private_key = file("minipro-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> privateIP.txt"
  }
}

resource "aws_ec2_instance_state" "miniproject-state" {
  instance_id = aws_instance.miniproject.id
  state       = "running"
}

output "WebPublicIP" {
  description = "Public IP of the Ubuntu Instance"
  value       = aws_instance.miniproject.public_ip
}

output "miniprojectKey" {
  description = "key of the instance"
  value       = aws_key_pair.minipro-key.key_name
}

