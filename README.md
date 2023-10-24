# EC2Setup

First go and create an aws account by paying 2 ruppes inr.
As you get 30 gb free storage we will create 2 15gb each instances(Jenkins-Master and Jenkins Admin) with ubuntu and get the private key to login. 


Now refer to the **setup.sh** file in repo


Once you are done with creating the Jenkins-Master instance make sure to update your system.

_sudo apt update
sudo apt updgrade
_


**Time to set security groups:
**

https://eu-north-1.console.aws.amazon.com/ec2/home?region=eu-north-1#SecurityGroup:group-id=sg-060c9d2d114686cb5 

Go to security groups and add Custom TCP / 8080 / anywhere in ipv4 in inbound rule. Because jenkins works in 8080 port only


**Install java -**  sudo sudo apt install openjdk-17-jre 

Now to go to jenkins weekly release page and get the command to install jenkins in your system


''' sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins '''

