# ─────────────────────────────────────────────────────────────
# main.tf  –  Módulo Cómputo AUY1105-grupo-1
# Gestiona: AMI, Key Pair, EC2 Instance
# ─────────────────────────────────────────────────────────────

data "aws_ami" "ubuntu_24_04" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "this" {
  key_name   = "${var.project_name}-key"
  public_key = var.public_key
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu_24_04.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = true

  user_data = var.user_data_script != "" ? filebase64(var.user_data_script) : null

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    encrypted   = true
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  tags = { Name = "${var.project_name}-ec2" }
}
