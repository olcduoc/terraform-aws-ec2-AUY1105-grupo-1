# Changelog – terraform-aws-ec2-AUY1105-grupo-1

Todos los cambios notables en este módulo serán documentados en este archivo.
Formato basado en [Keep a Changelog](https://keepachangelog.com/es/1.0.0/).
Este proyecto adhiere a [Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-05-28

### Added
- Módulo inicial de cómputo extraído del repositorio principal AUY1105-GRUPO-Nro1.
- Data source `aws_ami` para obtener Ubuntu 24.04 LTS más reciente.
- Recurso `aws_key_pair` parametrizado con variable `public_key`.
- Recurso `aws_instance` con IMDSv2 habilitado y disco raíz cifrado.
- Soporte para script de aprovisionamiento via `user_data_script`.
- Outputs: `instance_id`, `instance_ip`, `key_name`.
- Archivo `versions.tf` con restricción Terraform `>= 1.5.0` y AWS provider `~> 5.0`.
- Carpeta `examples/basic` con ejemplo funcional de uso del módulo.
- Documentación completa en `README.md`.

## [0.1.0] - 2026-05-28

### Added
- Estructura inicial del repositorio del módulo.
- Archivos base: `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`.
- Archivo `.gitignore` para excluir archivos temporales de Terraform.

## [1.0.1] - 2026-05-29

### Changed
- PR de revisión de código del módulo cómputo
