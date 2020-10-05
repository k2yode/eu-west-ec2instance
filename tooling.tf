####################
#AWS Provider settings
####################

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
  }


################################
# Template user_data
################################
  data "template_file" "myuserdata" {
  template = "${file("${path.cwd}/userdata.tpl")}"
  }

################################
#S3 Bucket to store tfstate file
################################
terraform {
  backend "s3" {
    bucket = "k22yde-eu-west-bucket"
    key    = "euwest.tfstate"
    region = "eu-west-2"
  }
}

################################
#EC-2 Instances Setup
################################

resource "aws_instance" "instance_x" {

  #Copy AMI Image
  ami   = "ami-002c706045586bd94"

  #Total instance to create
  count = 1

  #instance type
  instance_type = "t2.micro"

  user_data = "${data.template_file.myuserdata.template}"
  #user_data = "${file("script.tpl")}"
  # https://www.lennu.net/terraform-interpolation-only-expressions-are-deprecated/
  #user_data = "${file("script.sh")}"

    #instance tags
  tags = {
    Name = "eu-west-Tooling-Server-${count.index + 1}"
      }

  #create security group
  vpc_security_group_ids = ["${aws_security_group.eu-west-sec-sg.id}"]
  
   #keyname
  key_name = "LDN_key"
}