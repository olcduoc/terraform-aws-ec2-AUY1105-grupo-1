# terraform-aws-ec2-AUY1105-grupo-1

## 1. Descripción

Módulo Terraform reutilizable para el despliegue de instancias de cómputo en AWS.
Gestiona la búsqueda de AMI Ubuntu 24.04 LTS, el Key Pair SSH y la instancia EC2
con configuraciones de seguridad reforzadas.

## 2. Objetivos

- Desacoplar la lógica de cómputo del repositorio principal para mayor reutilización.
- Parametrizar todos los recursos de cómputo mediante variables.
- Exponer outputs estándar (`instance_id`, `instance_ip`) para integración con otros módulos.

## 3. Recursos creados

| Recurso          | Descripción                                        |
|------------------|----------------------------------------------------|
| `aws_ami`        | Data source: Ubuntu 24.04 LTS más reciente         |
| `aws_key_pair`   | Par de claves SSH para acceso a la instancia       |
| `aws_instance`   | Instancia EC2 t2.micro con IMDSv2 y disco cifrado  |

## 4. Variables

| Variable           | Tipo     | Requerida | Descripción                                              |
|--------------------|----------|-----------|----------------------------------------------------------|
| `project_name`     | `string` | ✅        | Nombre base para etiquetar los recursos                  |
| `subnet_id`        | `string` | ✅        | ID de la subred donde se desplegará la instancia         |
| `security_group_id`| `string` | ✅        | ID del Security Group a asignar a la instancia           |
| `public_key`       | `string` | ✅        | Clave pública SSH (sensitive)                            |
| `instance_type`    | `string` | ❌        | Tipo de instancia (default: `t2.micro`)                  |
| `volume_size`      | `number` | ❌        | Tamaño del volumen raíz en GB (default: `8`)             |
| `volume_type`      | `string` | ❌        | Tipo de volumen EBS (default: `gp3`)                     |
| `user_data_script` | `string` | ❌        | Ruta al script de aprovisionamiento (default: `""`)      |

## 5. Outputs

| Output        | Descripción                                    |
|---------------|------------------------------------------------|
| `instance_id` | ID de la instancia EC2 creada                  |
| `instance_ip` | IP pública asignada a la instancia EC2         |
| `key_name`    | Nombre del Key Pair creado para acceso SSH     |

## 6. Instrucciones de uso

```hcl
module "computo" {
  source = "github.com/osleivac/terraform-aws-ec2-AUY1105-grupo-1"

  project_name      = "AUY1105-GRUPO-Nro1"
  subnet_id         = module.redes.subnet_ids[0]
  security_group_id = module.redes.security_group_id
  public_key        = var.public_key
  user_data_script  = "./install.sh"
}
```

Ver ejemplo completo en [examples/basic](./examples/basic).

## 7. Versionado

Este módulo sigue [Semantic Versioning](https://semver.org/). Ver [CHANGELOG.md](./CHANGELOG.md).

---

**Integrantes:** Juan Pablo - Oscar Leiva
**Docente:** Camilo Jerez
**Institución:** Duoc UC - 2026
