# :rocket: EC2 Setup Guide

This guide will walk you through setting up a Jenkins environment on AWS EC2 instances.

# :moneybag:  Create an AWS Account 
Start by creating an AWS account. You may need to pay a small fee to set up your account. 

# :computer: : Launch EC2 Instances

1. Create two EC2 instances, one for Jenkins Master and one for Jenkins Agent. Each instance should have 15GB of storage, and they should both run Ubuntu.
2. Make sure to save the private key for SSH access to these instances.

Refer to the `setup.sh` file in the repository for further setup instructions.

# :arrow_up: : Update Your System

After creating the Jenkins-Master instance, update your system with the following commands:

`sudo apt update`
`sudo apt upgrade`

# :shield: : Configure Security Groups
Go to the AWS EC2 Security Group page and add an inbound rule for Custom TCP on port 8080 from anywhere in IPv4. Jenkins uses port 8080.

# :coffee: : Install Java
Install OpenJDK 17 with the following command:

`sudo apt install openjdk-17-jre`

# :building_construction: : Install Jenkins
Go to the Jenkins weekly release page and get the command to install Jenkins on your system. Run the following commands:

`sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins`

# :gear: : Enable Jenkins Service
After Jenkins installation, enable the Jenkins service to run at boot:
`sudo systemctl enable jenkins`
`sudo systemctl start jenkins`

# :arrows_counterclockwise: : Set Up Jenkins Agent
Repeat the same steps as for Jenkins-Master on the new virtual machine, including updating, configuring security groups, and installing Java.
:package: Install Docker
`sudo apt-get install docker.io`


Give full rights to Docker as a user:

`sudo usermod -aG docker $USER`

:key: Edit SSH Configuration
Edit the SSH configuration file in both the VMs:

`sudo nano /etc/ssh/sshd_config`

Uncomment the following lines:

PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2

Reload the SSH service:

`sudo service sshd reload `

:key: Generate SSH Keys

On the Jenkins-Master instance, generate SSH keys:

`ssh-keygen`

This will create SSH public and private keys. Copy the public key contents from /home/ubuntu/.ssh/.

On the Jenkins-Agent, open the .ssh/ folder and edit the authorized_keys file. Paste the public key from Jenkins-Master in this file.

# 🐈: Time to do jenkins setup
head over to ` cd .ssh/ `

then   ` sudo cat /var/lib/jenkins/secrets/initialAdminPassword ` to get the admin password

now login to jenkins by doing jenkins master ip-adress:8080 in your browser because the it's running there.

- install suggested plugin 
- set credentials and start using jenkins
- Manage jenkins nodes and set no of executors 0 and save
- again go to manage -> new node -> give name (Jenkins-agent) permanent agent and create -> no of executors 2 -> remote root directory /home/ubuntu/ -> label agent -> usage use as possible  -> lunch method lunch agents via ssh -> host (jenkins agent private id adress) -> credentials add jenkins -> kind ssh username with private key ->  id (jenkins agent) -> username ubuntu -> private key enter directly (go to jenkins master and find ssh private key and paste the contents) -> host key verfication strategy (non verifying verification) -> save
