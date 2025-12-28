locals {
    ec2_ami_id = var.ec2_os_type == "linux" ? var.linux_ami : ( var.ec2_os_type == "windows" ? var.windows_ami : var.mac_ami)
}