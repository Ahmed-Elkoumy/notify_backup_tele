# backup-notification-telegram
The "Telegram Backup Notification" repository contains an Ansible script designed to automate and streamline the monitoring of backup operations across multiple servers. The script's primary function is to check the status of backups and notify the user via Telegram about the results.
Key Features:

1-Backup Monitoring Automation: Utilizes Ansible to periodically check the status of backups on specified servers.

2-Notification Integration: Integrates with Telegram API to send real-time notifications about backup completion status.

3-Error Handling: Detects and reports any backup failures or errors encountered during the process.

4-Customizable Configuration: Offers flexibility through configurable parameters for server addresses, backup paths, and notification settings.

5-Logging and Reporting: Maintains logs of backup status checks and notifications for accountability and troubleshooting purposes.
Deployment Steps:

    Install Ansible:
        Ensure Ansible is installed on your local machine:
            On Ubuntu:

            bash

sudo apt install ansible

On CentOS, Red Hat, or Rocky Linux:



        sudo yum install ansible

Clone the Repository:

    Clone the "Telegram Backup Notification" repository from GitHub:

   

    git clone git@github.com:Ahmed-Elkoumy/notify_backup_tele.git
    cd notify_backup_tele

Create and Configure the Inventory File:

    Create a new Ansible Vault-encrypted inventory file (hosts.ini) with a strong password:

    

ansible-vault create hosts.ini

Add your server configurations to hosts.ini:

    For EC2 instances:

    

vps1 ansible_host=<EC2-IP> ansible_user=ec2-user ansible_ssh_private_key_file=<PATH-TO-private-key>

For other servers:



        <Server-Name> ansible_host=<Server-IP> ansible_user=root ansible_port=<SSH-port> ansible_ssh_pass=<Server-Password>

Deploy the Ansible Playbook:

    Execute the deployment script (deploy_script.yml) with Ansible:

  

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini deploy_script.yml --ask-vault-pass

Provide the Ansible Vault password when prompted.

    
