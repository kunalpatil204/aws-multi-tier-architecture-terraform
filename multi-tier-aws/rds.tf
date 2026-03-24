#DB subnet 
resource "aws_db_subnet_group" "db_subnet" {
  name = "db-subnet-group"

  subnet_ids = [
    aws_subnet.private_db_az1.id,
    aws_subnet.private_db_az2.id
  ]

  tags = {
    Name = "db-subnet-group"
  }
}

#RDS creation 
resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = "admin"
  password             = "Pass1234"
  skip_final_snapshot  = true

  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false
}