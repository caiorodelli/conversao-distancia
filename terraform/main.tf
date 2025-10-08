provider "aws" {
  region = var.aws_region
}

# Cluster ECS
resource "aws_ecs_cluster" "app_cluster" {
  name = var.ecs_cluster_name
}

# 👉 Aqui trocamos o resource por data, pois a Role já existe
data "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_execution_role_name
}

# 👉 Como a role já existe, você não precisa anexar política de novo
# Remova completamente o bloco aws_iam_role_policy_attachment

# Task Definition
resource "aws_ecs_task_definition" "app_task" {
  family                   = var.ecs_task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.docker_image_url
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "app_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.app_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = true
    security_groups  = [var.security_group_id]
  }

  # 👇 Removemos a dependência, pois não existe mais o attachment
  depends_on = [aws_ecs_task_definition.app_task]
}

