variable "access_key" {
  type    = "string"
  default = ""
}

variable "secret_key" {
  type    = "string"
  default = ""
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-central-1"
}

resource "aws_instance" "https" {
  ami           = "ami-7c4f7097"
  instance_type = "t2.micro"
  key_name	= "aws_pair"
  security_groups	= ["ssltest-sorint.ml"]

  tags {
    Name = "www"
  }
}
