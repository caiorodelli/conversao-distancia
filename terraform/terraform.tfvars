aws_region              = "us-east-2"
ecs_cluster_name        = "claude-cluster"
ecs_execution_role_name = "ecsExecutionRole"
ecs_task_family         = "claude-task-family"
container_name          = "claude-container"
ecs_service_name        = "claude-task-service-hcgdhzyx"
docker_image_url        = "319700097359.dkr.ecr.us-east-2.amazonaws.com/claude-app:latest"
subnet_ids              = ["subnet-0125220018dacf0a6", "subnet-0209436fc39771895"]
security_group_id       = "sg-078865b1f169f1cd9"

