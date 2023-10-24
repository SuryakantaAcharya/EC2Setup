# EC2Setup

First go and create an aws account by paying 2 ruppes inr.
As you get 30 gb free storage we will create 2 15gb each instances(Jenkins-Master and Jenkins Agent) with ubuntu and get the private key to login. 


Now refer to the **setup.sh** file in repo


Once you are done with creating the Jenkins-Master instance make sure to update your system.

_sudo apt update
sudo apt updgrade
_


**Time to set security groups:**

https://eu-north-1.console.aws.amazon.com/ec2/home?region=eu-north-1#SecurityGroup:group-id=sg-060c9d2d114686cb5 

Go to security groups and add Custom TCP / 8080 / anywhere in ipv4 in inbound rule. Because jenkins works in 8080 port only


**Install java -**  sudo sudo apt install openjdk-17-jre 

Now to go to jenkins weekly release page and get the command to install jenkins in your system


<pre>
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins 
</pre>



Once jenkins installation is done make sure to run this command to run it in every boot - _sudo systemctl enable jenkins_


to start jenkins use this : _sudo systemctl start jenkins_

**Time to create jenkins-agent the new Virtual machine - repeat same steps as prev one.**

make sure to update and upgrade that. 
To get rid of confusion make sure to edit host name by doing 

_sudo nano /etc/hostname_

now edit the file and hit Ctrl+X and hit enter

Install java in this too. 

All build will also happen in this agent so we need docker as well. 
cmd - _sudo apt-get install docker.io_


Give full rights to the docker as user by this.
cmd - _sudo usermod -aG docker $USER_

Now to to ssh config file _sudo nano /etc/ssh/sshd_config_
uncomment these 2 lines 
_PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys .ssh/authorized_keys2_

do the same in **jenkins-master** 

reload the ssh service in both the VMs cmd - _sudo service sshd reload_

Go to jenkins-master and do cmd - _ssh-keygen_  
It will create ssh public and private keys.
Go to _/home/ubuntu/.ssh/_
Copy the public key contents
Go to Jenkins-agent and open .ssh/ folder
There you will find _authorized_keys_ file.
Open that and paste the public key from jenkins-master there.



