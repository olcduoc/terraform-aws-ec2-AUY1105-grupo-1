# ─────────────────────────────────────────────────────────────
# variables.tf  –  Módulo Cómputo AUY1105-grupo-1
# ─────────────────────────────────────────────────────────────

variable "project_name" {
  description = "Nombre base del proyecto, usado para etiquetar todos los recursos."
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2. Solo se permite t2.micro según política OPA."
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID de la subred pública donde se desplegará la instancia EC2."
  type        = string
}

variable "security_group_id" {
  description = "ID del Security Group que se asignará a la instancia EC2."
  type        = string
}

variable "public_key" {
  description = "Clave pública SSH inyectada por pipeline para acceso a la instancia."
  type        = string
  sensitive   = true
}

variable "volume_size" {
  description = "Tamaño del volumen raíz en GB."
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Tipo de volumen EBS para el dispositivo raíz."
  type        = string
  default     = "gp3"
}

variable "user_data_script" {
  description = "Ruta al script de aprovisionamiento que se ejecutará al iniciar la instancia."
  type        = string
  default     = ""
}
