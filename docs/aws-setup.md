# AWS Infrastructure Setup

## Overview

We created two Ubuntu Linux servers using AWS EC2 to build an automated file transfer system.

The infrastructure was configured manually through the AWS Management Console.

## EC2 Configuration

| Setting | Configuration |
|---|---|
| Cloud Provider | AWS |
| Region | Singapore (ap-southeast-1) |
| Operating System | Ubuntu Server 24.04 LTS |
| Instance Type | t3.micro |
| Number of Instances | 2 |
| Storage | 8 GiB gp3 EBS per instance |
| Encryption | Enabled (aws/ebs) |
| Network | Same VPC |
| Authentication | SSH Key Pair (ED25519) |

## Instance Roles

- **file-transfer-server-1:** Source server responsible for running the Bash script, rsync, and cron.
- **file-transfer-server-2:** Destination server that receives transferred files.

## Deployment Steps

1. Open the AWS Management Console.
2. Navigate to EC2 and select Launch Instance.
3. Enter the instance name.
4. Select Ubuntu Server 24.04 LTS.
5. Choose the t3.micro instance type.
6. Create or select an SSH key pair.
7. Configure network settings and security groups.
8. Configure an 8 GiB encrypted gp3 EBS volume.
9. Launch the first instance.
10. Repeat the process for the second instance in the same VPC.

## Networking and Security

Both instances were deployed within the same VPC.

Public IP addresses were used for SSH access from the local computer.

Private IP addresses were used for communication between EC2 instances.

Security Group configuration:

- SSH (TCP port 22) from the administrator's IP address.
- Additional SSH access on Server 2 from Server 1's Security Group.
- No HTTP or HTTPS inbound access was required.

## Verification

After launching the instances, we verified that both were running and accessible through SSH.

We used basic Linux commands to verify the environment:

- whoami
- hostname
- pwd
- uname -a

Both Ubuntu servers were successfully configured and verified.

## Notes

EC2 instances and EBS storage may generate AWS charges. Unused resources should be stopped or deleted when no longer needed.

