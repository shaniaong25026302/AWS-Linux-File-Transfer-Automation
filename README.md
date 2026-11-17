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

## Troubleshooting

During the project, we encountered SSH authentication errors and incorrect Linux file paths.

We resolved these issues by checking SSH public keys, permissions, Security Group rules, and directory paths.

These troubleshooting steps helped us better understand Linux administration and cloud networking.

## Security

SSH access is restricted through AWS Security Groups.

A separate SSH key is used for communication between the two servers. Private SSH keys are not stored in this repository.

## Project Script

The Bash automation script is available in the file scripts/transfer.sh file in this repository.


## Testing and Results

Four tests were conducted to verify the functionality, automation, and reliability of the AWS Linux File Transfer Automation system.

### Test Results

| No. | Test Case | Test Description | Result |
|:---:|---|---|:---:|
| 1 | **SSH Connection** | Verified SSH authentication between Server 1 and Server 2. Resolved the initial public key authentication issue. | ✅ PASS |
| 2 | **Manual File Transfer** | Transferred `test.txt` using rsync and verified that the file was received on Server 2. | ✅ PASS |
| 3 | **Automated File Transfer** | Configured cron to execute the Bash script every 5 minutes. Verified that `cron-test.txt` was transferred automatically. | ✅ PASS |
| 4 | **Failure Recovery** | Simulated a permission error by changing the destination to `/root/received-files/`. Restored the correct destination and manually reran the script to verify recovery. | ✅ PASS |

### Failure Recovery Test Details

| Item | Details |
|---|---|
| **Objective** | Verify that the Bash script detects and logs transfer failures, and that missing files can be transferred after correcting the issue. |
| **Test File** | `recovery-test.txt` |
| **Failure Simulation** | Modified a temporary copy of the Bash script to use `/root/received-files/` as the destination. |
| **Expected Result** | The transfer should fail due to insufficient permissions, record `Transfer failed` in the log, and successfully transfer the missing file after correcting the configuration and rerunning the original script. |
| **Actual Result** | The incorrect destination caused a permission error, and the script logged `Transfer failed`. After running the original script with the correct destination, rsync successfully transferred `recovery-test.txt`. |
| **Verification** | Confirmed that Server 2 received `recovery-test.txt` and that the transfer logs recorded the failure and subsequent success. |
| **Result** | ✅ PASS |

### Test Summary

**Overall Result: 4/4 Tests Passed**

The tests demonstrated that the system supports:

- **Secure Authentication:** SSH key-based authentication between EC2 instances.
- **Reliable File Transfer:** rsync transfers files between Server 1 and Server 2.
- **Scheduled Automation:** Cron executes the transfer script every 5 minutes.
- **Error Logging:** Failed transfers are recorded in the log file.
- **Failure Recovery:** Missing files can be transferred after correcting the configuration and manually rerunning the script.

> **Current Limitation:** Automatic retry logic is not implemented within the Bash script. Recovery currently requires correcting the underlying issue, followed by manual re-execution or a subsequent scheduled cron execution.

### Future Improvement	Description
Terraform	Automate AWS infrastructure provisioning to improve consistency and reduce manual configuration.
Amazon CloudWatch	Centralise logs, monitor file transfers, and send alerts when failures occur.
