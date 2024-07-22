### Backup-Notification-Telegram

The "Telegram Backup Notification" repository contains an Ansible playbook designed to automate and streamline the monitoring of backup operations across multiple servers. The script's primary function is to check the status of backups and notify the user via Telegram about the results.

Key Features:

-Backup Monitoring Automation: Utilizes Ansible to periodically check the status of backups on specified servers.

-Notification Integration: Integrates with Telegram API to send real-time notifications about backup completion status.

-Error Handling: Detects and reports any backup failures or errors encountered during the process.

-Customizable Configuration: Offers flexibility through configurable parameters for server addresses, backup paths, and notification settings.

-Logging and Reporting: Maintains logs of backup status checks and notifications for accountability and troubleshooting purposes.


### How to Send a Message from Your Server to Telegram

## Step 1: Create a Telegram Bot
1. Open Telegram and search for "BotFather".
2. Start a chat with the BotFather and send the command `/newbot`.
3. Follow the instructions to create a new bot. You'll get a token that looks like `123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11`.

## Step 2: Get Your Chat ID
1. Start a chat with your new bot by searching for it in Telegram and clicking on the "Start" button.
2. Open the following URL in your browser, replacing `YOUR_BOT_TOKEN` with the token you got from BotFather:
   ```sh
   https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
3- Send anything to your bot now and refresh the above URL.
 Look for the chat object in the response, which contains your id. This is your chat ID.

 
### Deployment Steps:

1. Install Ansible:
   - Ensure Ansible is installed on your local machine:
     - On Ubuntu:
       ```bash
       sudo apt install ansible
       ```
     - On CentOS, Red Hat, or Rocky Linux:
       ```bash
       sudo yum install ansible
       ```

2. Clone the Repository:
   - Clone the "Telegram Backup Notification" repository from GitHub:
     ```bash
     git clone git@github.com:Ahmed-Elkoumy/notify_backup_tele.git
     cd notify_backup_tele
     ```

3. Create and Configure the Inventory File:
   - Create a new Ansible Vault-encrypted inventory file (`hosts.ini`) with a strong password:
     ```bash
     ansible-vault create hosts.ini
     ```
   - Add your server configurations to `hosts.ini`:
     - For EC2 instances:
       ```ini
       vps1 ansible_host=<EC2-IP> ansible_user=ec2-user ansible_ssh_private_key_file=<PATH-TO-private-key>
       ```
     - For other servers:
       ```ini
       <Server-Name> ansible_host=<Server-IP> ansible_user=root ansible_port=<SSH-port> ansible_ssh_pass=<Server-Password>
       ```

4. Deploy the Ansible Playbook:
   - Execute the deployment script (`deploy_script.yml`) with Ansible:
     ```bash
     ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini deploy_script.yml --ask-vault-pass
     ```
   - Provide the Ansible Vault password when prompted.
    
