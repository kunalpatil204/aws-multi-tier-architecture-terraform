#Monitor using cloudwatch 
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  alarm_description = "Alarm when CPU > 70%"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}