
data "aws_vpc" "Default" {
  default = true

}

data "aws_ami" "Ubuntu" {
  most_recent = true


}

data "aws_subnets" "sunetid" {


}

data "aws_security_groups" "secgroup" {
 


}

output "vpc_id" {
  value = data.aws_vpc.Default.id

}

output "aws_ami" {
  value = data.aws_ami.Ubuntu.id

}

output "subnetz" {
  value = data.aws_subnets.sunetid.ids

}

output "securitygroup_ids" {
  value = data.aws_security_groups.secgroup.ids

}

output "sgname" {
    value = data.aws_security_groups.secgroup.tags
  
}

