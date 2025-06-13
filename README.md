# 🚀 Terraform AWS Web App Deployment

Deploy a **scalable web application** on AWS with:
- **Auto Scaling EC2** instances
- **PostgreSQL RDS** database
- **Redis ElastiCache** caching
- **Application Load Balancer**

## 📋 Prerequisites
1. AWS Account ([Sign Up Here](https://aws.amazon.com/))
2. AWS CLI ([Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
3. Terraform ([Download](https://www.terraform.io/downloads))

## 🛠️ Setup
1. Clone this repo:
   ```bash
   git clone https://github.com/your-repo/terraform-webapp.git
   cd terraform-webapp


## things you need to change from the code before using it 
1.  this      # EC2 Variables
ami_id        = "ami-09e6f87a47903347c"
instance_type = "t2.micro"
key_name      = "webner"
region        = "us-est-1
yuo have to go to yuor aws and runch an instance select ubuntu or amazone 
you will see yuor own ami at the right up just coppy it and replace it to where i put my
2. create a keypair if u have one already u can use it  just replace the name with my own 
3. choose the instance type that u wanted  
4. remenber that yuor region should be here as well so replace yuors with my 

## commands to run this 
1. terraform fmt
2. terraform init
3. terraform validate 
4. terraform plan
5. terraform apply