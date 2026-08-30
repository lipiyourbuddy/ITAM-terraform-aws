output "backend_public_ip" {
  description = "Public IP address of the backend EC2 instance"
  value       = aws_instance.backend.public_ip
}

output "backend_public_dns" {
  description = "Public DNS name of the backend EC2 instance"
  value       = aws_instance.backend.public_dns
}

output "frontend_website_endpoint" {
  description = "S3 static website endpoint for the frontend"
  value       = aws_s3_bucket_website_configuration.frontend.website_endpoint
}