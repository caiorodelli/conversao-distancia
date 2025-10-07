output "ecs_cluster_name" {
  value = aws_ecs_cluster.app_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.app_service.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.app_task.arn
}

