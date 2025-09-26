    resource "aws_key_pair" "mykeyname" {
        key_name   = "${var.env}-mykeyname"
        public_key = file("C:/Users/vineet.k/.ssh/mykeyname.pub")

        tags = {
          Name        = "${var.env}-mykeyname"
          Environment = var.env
        }
      
    } 

    resource "aws_default_vpc" "default" {
      
    }

    resource "aws_security_group" "my_security_group" {
      name        = "${var.env}-infra-sg"
      description = "My security group"
      vpc_id      = aws_default_vpc.default.id

      ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/16"]
    }
        ingress {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/16"]

    }

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/16"]
    }

    tags = {
        Name        = "${var.env}-infra-sg"
        Environment = var.env
      }

    }

    resource "aws_instance" "my_ec2_instance" {
      count = var.instance_count
      ami = var.ami_id
      instance_type = var.instance_type
      key_name      = aws_key_pair.mykeyname.key_name
      security_groups = [aws_security_group.my_security_group.name]

      depends_on = [ aws_security_group.my_security_group]

      root_block_device {
        volume_size = var_env == "prod" ? 20 : 10
        volume_type = "gp2"
        delete_on_termination = true
      }

      tags = {
        Name        = "${var.env}-infra-app-instance"
        Environment = var.env
      }
    }

    