# Creating VPC here 
# Defining the CIDR block use 10.0.0.0/24
 resource "aws_vpc" "Main" {                
   cidr_block       = var.main_vpc_cidr    
   instance_tenancy = "default"
 }

# Creating Internet Gateway
 # vpc_id will be generated after we create VPC
 resource "aws_internet_gateway" "IGW" {    
    vpc_id =  aws_vpc.Main.id              
 }

 resource "aws_subnet" "publicsubnets" {    # Creating Public Subnets
   vpc_id =  aws_vpc.Main.id
   cidr_block = "${var.public_subnets}"        # CIDR block of public subnets
 }
# Creating Private Subnets
 # CIDR block of private subnets
 resource "aws_subnet" "privatesubnets" {
   vpc_id =  aws_vpc.Main.id
   cidr_block = "${var.private_subnets}"         
 }

 # Creating RT for Public Subnet
 # Traffic from Public Subnet reaches Internet via Internet Gateway
 resource "aws_route_table" "PublicRT" {   
    vpc_id =  aws_vpc.Main.id
         route {
    cidr_block = "0.0.0.0/0"               
    gateway_id = aws_internet_gateway.IGW.id
     }
 }

 # Creating RT for Private Subnet
 # Traffic from Private Subnet reaches Internet via NAT Gateway
 resource "aws_route_table" "PrivateRT" {   
   vpc_id = aws_vpc.Main.id
   route {
   cidr_block = "0.0.0.0/0"             
   nat_gateway_id = aws_nat_gateway.NATgw.id
   }
 }

 resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnets.id
    route_table_id = aws_route_table.PublicRT.id
 }

 resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.privatesubnets.id
    route_table_id = aws_route_table.PrivateRT.id
 }
 resource "aws_eip" "nateIP" {
   vpc   = true
 }

 resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.publicsubnets.id
 }

