module "dev-infra-app" {
  source = "./infra-app"

  env         = "dev"
  bucket_name = "infra-app-remote-state"
  instance_count = 1
  instance_type = "t2.micro"
  ami_id = "ami-0360c520857e3138f" # Ubuntu
  hash_key    = "LOCKID"
  
}


module "prod-infra-app" {
  source = "./infra-app"

  env         = "prod"
  bucket_name = "infra-app-remote-state"
  instance_count = 2
  instance_type = "t2.medium"
  ami_id = "ami-0360c520857e3138f" # Ubuntu
  hash_key    = "LOCKID"
  
}

module "stg-infra-app" {
  source = "./infra-app"

  env         = "stg"
  bucket_name = "infra-app-remote-state"
  instance_count = 1
  instance_type = "t2.small"
  ami_id = "ami-0360c520857e3138f" # Ubuntu
  hash_key    = "LOCKID"
  
}
