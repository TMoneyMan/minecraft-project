# Minecraft Server Setup Tutorial

## Background

In this tutorial, we will set up a Minecraft server on AWS using Terraform and Ansible. The process involves creating necessary AWS infrastructure, configuring the server, and finally connecting to the Minecraft server. 

## Requirements

Before you begin, ensure you have the following:

### Tools
- [Terraform](https://www.terraform.io/downloads.html) installed.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed.
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed.

### Credentials
- AWS credentials configured. You can set these up using the CLI:
  ```bash
    aws configure set aws_access_key_id "Your AWS key id"
    aws configure set aws_secret_access_key "Your AWS access key"
    aws configure set aws_session_token "Your AWS session token"
  ```

## Running the scripts

### Terraform
- First initialize Terraform, and apply any changes:
    ```
        terraform init 
        terraform apply
    ```

### Hosts.ini
- Set the public ip within hosts.ini for the ansible playbook:
    ```
        [minecraft]
        <instance_public_ip> ansible_user=ec2-user ansible_ssh_private_key_file=./lab7.pem
    ```

### Ansible Playbook
- Run the playbook:
    ```
        ansible-playbook -i hosts.ini minecraft.yaml
    ```

### Connect to server (nmap)
```
    nmap -sV -Pn -p T:25565 <instance_public_ip>
```
    
    
    

### Connect to server (Minecraft client)
- Open minecraft and enter the IP address to direct connect or add server.
    ```
        <instance_public_ip>:25565
    ```