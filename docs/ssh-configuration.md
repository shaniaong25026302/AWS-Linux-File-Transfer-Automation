# SSH Configuration

## Overview

SSH was configured to provide secure remote access to our EC2 instances and communication between Server 1 and Server 2.

## 1. Local Computer to EC2

An ED25519 SSH key pair was created through AWS EC2.

The private key was downloaded and stored securely on the local computer.

We used PowerShell to connect to the Ubuntu instances:

ssh -i "path/to/private-key.pem" ubuntu@SERVER_PUBLIC_IP


This allowed us to remotely manage the servers and execute Linux commands.

## 2. Server 1 to Server 2

A separate SSH key pair was generated on Server 1:

ssh-keygen -t ed25519 -f ~/.ssh/file-transfer-internal -C "server1-to-server2"


This created:

- file-transfer-internal — private key stored on Server 1.
- file-transfer-internal.pub — public key used for authentication.

## 3. Public Key Configuration

We displayed the public key on Server 1:

cat ~/.ssh/file-transfer-internal.pub


Then added it to the following file on Server 2:

nano ~/.ssh/authorized_keys


The existing authorized keys were preserved.

We also verified the SSH directory and file permissions:

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys


## 4. Security Group Configuration

Server 2's Security Group was configured to allow inbound SSH traffic on TCP port 22 from Server 1's Security Group.

This allows communication through private IP addresses without exposing inter-server SSH traffic to the public internet.

## 5. Connection Testing

From Server 1, we tested SSH access to Server 2:

ssh -i ~/.ssh/file-transfer-internal ubuntu@SERVER_2_PRIVATE_IP


The connection was successful without requiring a password.

## 6. Troubleshooting

During setup, we encountered:

**Permission denied (publickey)**

The problem was resolved by correctly adding Server 1's public key to Server 2's authorized_keys file.

We also checked SSH permissions and Security Group rules.

## Result

Server 1 can securely connect to Server 2 using its private IP address and a dedicated SSH key.

This connection is used by rsync for automated file transfers.

Private SSH keys are never uploaded to GitHub.