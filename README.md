# ITAM Infrastructure (Terraform)

Provisions the AWS infrastructure for the ITAM (IT Asset Management) application:

- **EC2 instance** (t3.micro, Ubuntu 22.04) running the backend Express API
- **Security group** restricting SSH to a single IP, exposing port 5000 publicly for the API
- **S3 bucket** configured for static website hosting, serving the React frontend, with a public-read bucket policy scoped to `s3:GetObject` only
- **Remote state** stored in a separate, private S3 bucket (not this one), with versioning and encryption enabled

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your own values (bucket name, IP address)
2. Generate an SSH key pair: `ssh-keygen -t rsa -b 4096 -f ./itam-terraform-key -N ""`
3. Configure an AWS CLI profile with least-privilege credentials: `aws configure --profile itam-terraform`
4. `terraform init`
5. `terraform plan`
6. `terraform apply`

## Notes

- AWS credentials are never stored in this repo — Terraform authenticates via a named AWS CLI profile (`itam-terraform`), configured separately on each machine that runs this.
- After `apply`, SSH into the instance (using the generated private key) to clone and run the application backend; build and upload the frontend to the created S3 bucket separately (not automated by this Terraform config — that's handled by a CI/CD pipeline, see the application repo).
