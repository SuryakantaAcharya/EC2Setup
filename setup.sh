#Do this so that you can get read access to your .pem key of aws. 4 means owner gets read access.
#Don't forget to assign the path or get to the place where your file exists.
chmod 400 Linux-VM-key.pem


# -i /path/to/your/key.pem  ec2-user@public-dns-or-ip - ec2user is the username you select then the next one is your aws public ip address 

ssh -i Linux-VM-key.pem ubuntu@51.**.***.***


#now you are good to go
