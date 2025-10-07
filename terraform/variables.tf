variable "aws_region" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_execution_role_name" {
  type = string
}

variable "ecs_task_family" {
  type = string
}

variable "container_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "docker_image_url" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

