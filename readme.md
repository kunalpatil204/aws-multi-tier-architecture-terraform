# 🚀 Enterprise-Grade Multi-Tier AWS Infrastructure using Terraform
📌 Project Overview

This project demonstrates a production-grade three-tier AWS architecture built using Terraform (Infrastructure as Code). The infrastructure is designed to be scalable, secure, and highly available, following real-world DevOps best practices.

🏗 Architecture:

![Uploading Multi-tier-aws.png…]()


🔄 Architecture Flow            
Internet → Application Load Balancer → EC2 (Auto Scaling) → RDS Database

⚙️ Key Components                 
VPC with CIDR block (10.0.0.0/16)     
Public Subnets for ALB (Multi-AZ)      
Private Subnets for EC2 and RDS      
Internet Gateway for public access     
NAT Gateway for private subnet internet access        
Application Load Balancer (ALB) for traffic distribution        
Auto Scaling Group (ASG) for dynamic scaling        
EC2 Instances configured with Nginx using user-data     
RDS (MySQL) in private subnet for secure database layer      
CloudWatch for monitoring and alerts            
S3 + DynamoDB for Terraform remote state management    

🛠 Tech Stack       
Cloud: AWS (VPC, EC2, ALB, ASG, RDS, IAM, CloudWatch, S3, DynamoDB)       
Infrastructure as Code: Terraform       
OS: Linux (Amazon Linux)          
Web Server: Nginx          
Version Control: Git & GitHub          

📂 Project Structure                                                         
📂multi-tier-aws        
├── provider.tf          # AWS provider configuration     
├── backend.tf           # S3 + DynamoDB backend       
├── vpc.tf               # VPC and Internet Gateway         
├── subnet.tf            # Public and Private subnets         
├── networking.tf        # NAT Gateway and Route Tables        
├── security_group.tf    # Security groups (ALB, EC2, RDS)      
├── EC2.tf               # Launch Template and EC2 config         
├── ALB.tf               # Load Balancer, Target Group, Listener         
├── rds.tf               # RDS and DB subnet group              
├── monitoring.tf        # CloudWatch alarms             
├── variables.tf         # Input variables             
├── outputs.tf           # Output values            

🔐 Security Design                     
EC2 instances deployed in private subnets           
RDS database isolated in private DB subnets                   

Security group chaining:    
ALB → EC2 → RDS       
No direct public access to application or database            

⚡ Features      
Infrastructure fully automated using Terraform         
Multi-AZ high availability architecture           
Auto Scaling based on demand             
Load balancing for traffic distribution              
Secure networking with private subnet isolation         
Monitoring using CloudWatch                         
Remote state management with S3 and DynamoDB            

🚀 Deployment Steps            
terraform init          
terraform plan            
terraform apply                 
                         
📊 Key Learnings             
AWS VPC and networking (subnets, routing, NAT)             
Load balancing and Auto Scaling concepts                
Security best practices in cloud architecture             
Infrastructure as Code using Terraform                     
Remote state management and locking                          
Monitoring and observability using CloudWatch                   

🎯 Future Improvements                         
Add HTTPS using ACM                                    
Integrate CI/CD pipeline (GitHub Actions / Jenkins)                 
Add WAF for enhanced security                          
Use Terraform modules for better reusability                  

👨‍💻 Author          
Kunal Patil             
Aspiring Cloud & DevOps Engineer            
