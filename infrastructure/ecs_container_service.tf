/*
 * Amazon ECS Container Service
 *
 * http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html
 */

resource "aws_ecs_task_definition" "phpcon2017" {
  family                = "phpcon2017"
  container_definitions = "${data.template_file.ecs_task_definitions.rendered}"
}

data "template_file" "ecs_task_definitions" {
  # http://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
  template = "${file("ecs_task_definitions.tpl.json")}"

  vars {
    region  = "${var.region}"
    image   = "${aws_ecr_repository.phpcon2017.repository_url}:production"
    php_mem = "${var.container_php_mem}"
  }
}
