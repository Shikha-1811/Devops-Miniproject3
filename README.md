# DevOps Mini Project 3 — Deploy Static Website on AWS using Terraform

This project uses Terraform to automatically provision an EC2 instance on AWS and deploy a static website on it.

- The EC2 instance is created by Terraform code (no manual setup).
- Apache2 is installed on the instance using a shell script (web.sh).
- A static website template from Tooplate is deployed to /var/www/html.
- An S3 bucket is configured as a remote backend to store Terraform state securely.

---

##  Technologies Used
- **Terraform** — Infrastructure as Code
- **AWS EC2 (Ubuntu Instance)** — Host the static website
- **AWS S3** — Store Terraform state remotely
- **Apache2** — Web server for serving the site

---

##  Project Structure
```
├── backend.tf # Config for S3 remote backend
├── provider.tf # AWS provider configuration
├── Keypair.tf # Creates key pair for SSH access
├── SecGrp.tf # Creates security group
├── InstId.tf / Instance.tf # Launches EC2 instance and installs Apache
├── web.sh # Shell script to configure Apache & deploy site
├── vars.tf # Variables used across resources
├── .gitignore # Ignore sensitive & local files
└── README.md # Project documentation
```

---

## 🚀 How to Use

1. **Initialize Terraform**
   ```bash
   terraform init
2. **Validate the configuration**
   ```bash
   terraform validate
3. **Plan and Apply**
   ```bash
   terraform plan
   terraform apply
4. **Access your website**
   Once the EC2 instance is created, note its public IP from the output and open it in your browser.

## Remote Backend (S3)

Make sure an S3 bucket is created and referenced in your backend.tf to store Terraform state files safely and support collaboration.

**Important Notes**

 Do not commit sensitive files:

-- .terraform/

-- *.tfstate / *.tfstate.backup

-- minipro-key (private key file)

All of these are ignored using .gitignore.

**Clean Up**
To destroy all created resources:
```bash
terraform destroy
