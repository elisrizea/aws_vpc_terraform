
# **Terraform AWS Virtual Private Cloud installation**
    Building a basic AWS VPC using Terraform from scratch.
    

# **Description:**
    VPC design components:
    1 VPC zone (ex: "us-east-1")
    2 Internet Gateway
    3 Public Subnets
    4 Private Subnets
    5 Two route Table configurations 
            -main rourte table that lets the components in the VPC communicate with each other internally.
             -2nd route table that allow Internet access

# **Require:**
    The appropriate package for your operating system from the Terraform.
    Installing or updating the latest version of the AWS CLI.
    AWS IAM user with the necessary permissions to create and manage VPC resources.
    

# **Installation:**
    Install Terraform:
       (https://www.terraform.io/downloads.html)
     AWS CLI installation:
        (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
        Configure AWS credentials:
            Create an IAM user in your AWS account with the necessary permissions to create and manage VPC resources.
            Generate an access key and secret key for the user.


# **Running:**
    Create a directory containing all my files.
    Edit terraform.tfvars and setup default values if required.
    run;
    terraform init
    terraform apply

# **Credits:**
    Alin Rizea
    https://www.linkedin.com/in/alin-rizea-b10368104/