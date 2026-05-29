# ─────────────────────────────────────────────────────────────
# examples/basic/main.tf
# Ejemplo de uso del módulo cómputo terraform-aws-ec2-AUY1105-grupo-1
# ─────────────────────────────────────────────────────────────

provider "aws" {
  region = "us-east-1"
}

# Se asume que subnet_id y security_group_id provienen del módulo redes.
# En un uso real, estos valores se obtendrían de los outputs del módulo redes.

variable "public_key" {
  description = "Clave pública SSH para acceso a la instancia."
  type        = string
  sensitive   = true
}

module "computo" {
  source = "github.com/osleivac/terraform-aws-ec2-AUY1105-grupo-1"

  project_name      = "AUY1105-GRUPO-Nro1"
  subnet_id         = "subnet-xxxxxxxxxxxxxxxxx"  # Reemplazar con output del módulo redes
  security_group_id = "sg-xxxxxxxxxxxxxxxxx"      # Reemplazar con output del módulo redes
  public_key        = var.public_key
  instance_type     = "t2.micro"
  volume_size       = 8
  volume_type       = "gp3"
}

output "instance_id" {
  value = module.computo.instance_id
}

output "instance_ip" {
  value = module.computo.instance_ip
}
