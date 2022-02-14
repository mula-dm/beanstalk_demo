resource "aws_elastic_beanstalk_application" "app" {
  name        = var.name
  description = var.name
}

resource "aws_elastic_beanstalk_environment" "test" {
  name                = var.name
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.11 running Docker"
  setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = "aws-elasticbeanstalk-ec2-role"
  }
}
