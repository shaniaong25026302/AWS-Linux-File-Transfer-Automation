# AWS Linux File Transfer Automation

## Project Overview

This project demonstrates how to automate secure file transfers between two Linux servers hosted on AWS EC2.

The goal is to use Linux, networking, Bash scripting, SSH, rsync, and cron to build a simple automated file transfer system.

## Technologies Used

- **AWS EC2** — Hosting two Ubuntu Linux servers.
- **Ubuntu 24.04 LTS** — Server operating system.
- **SSH** — Secure communication between servers.
- **rsync** — File transfer and synchronization.
- **Bash** — Automating the transfer process.
- **cron** — Scheduling automatic transfers.
- **Logging** — Recording successful and failed transfers.

## Architecture

<img width="987" height="553" alt="Screenshot 2026-11-17 215957" src="https://github.com/user-attachments/assets/a6bd2e18-4d34-42a9-9637-89347f4be0aa" />


## How It Works

The source directory is /home/ubuntu/files-to-transfer/ on Server 1.

The destination directory is /home/ubuntu/received-files/ on Server 2.

A Bash script runs rsync to synchronize files between these directories. The script records transfer results in /home/ubuntu/logs/transfer.log.

We also configured cron to run the script automatically every five minutes during testing.

The automation can run without manually connecting to Server 2.

## Testing and Results

We successfully tested manual file transfers using rsync.

We also created cron-test.txt on Server 1 and confirmed that cron automatically transferred it to Server 2.

The log file recorded the transfer timestamps and successful execution.

## Troubleshooting

During the project, we encountered SSH authentication errors and incorrect Linux file paths.

We resolved these issues by checking SSH public keys, permissions, Security Group rules, and directory paths.

These troubleshooting steps helped us better understand Linux administration and cloud networking.

## Security

SSH access is restricted through AWS Security Groups.

A separate SSH key is used for communication between the two servers. Private SSH keys are not stored in this repository.

## Project Script

The Bash automation script is available in the file scripts/transfer.sh file in this repository.


