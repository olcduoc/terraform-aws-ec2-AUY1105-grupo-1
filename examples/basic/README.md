# Ejemplo Básico – Módulo Cómputo

Este ejemplo muestra el uso básico del módulo `terraform-aws-ec2-AUY1105-grupo-1`
para desplegar una instancia EC2 Ubuntu 24.04 LTS en AWS.

## Recursos que crea

- Key Pair SSH asociado al proyecto
- Instancia EC2 `t2.micro` con Ubuntu 24.04 LTS
- Disco raíz cifrado de 8 GB tipo gp3
- IMDSv2 habilitado (tokens requeridos)

## Prerrequisitos

- Tener desplegado el módulo redes `terraform-aws-vpc-AUY1105-grupo-1`
- Contar con `subnet_id` y `security_group_id` del módulo redes

## Uso

```bash
terraform init
terraform plan -var="public_key=TU_CLAVE_PUBLICA"
terraform apply -var="public_key=TU_CLAVE_PUBLICA"
```

## Requisitos

| Herramienta  | Versión mínima |
|--------------|----------------|
| Terraform    | >= 1.5.0       |
| AWS Provider | ~> 5.0         |
