# ─────────────────────────────────────────────────────────────
# outputs.tf  –  Módulo Cómputo AUY1105-grupo-1
# ─────────────────────────────────────────────────────────────

output "instance_id" {
  description = "ID de la instancia EC2 creada."
  value       = aws_instance.this.id
}

output "instance_ip" {
  description = "IP pública asignada a la instancia EC2."
  value       = aws_instance.this.public_ip
}

output "key_name" {
  description = "Nombre del Key Pair creado para acceso SSH."
  value       = aws_key_pair.this.key_name
}
