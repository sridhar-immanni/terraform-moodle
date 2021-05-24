# terraform-moodle

Created EC2 instance manually and installed terraform in it.


Created VPC,one public subnet,two private subnets,one internet gateway, one NAT Gateway, 
  one instance in private-subnet-1, one instance in public-subnet-1 using terraform
  
  
Created "play.yaml" file for installing Moodle dependencies and giving permissions to the /var/www/html/moodledata directory


Created shell script "ansible.sh" to install "apache,ansible" 
  and configuring other moodle dependencies like enabling moodle site, restarting apache server and running ansible playbook
  
  
By running ansible playbook we are going to install sql and php dependancies and
  downloading moodle file and moving the moodle to "/var/www/html/moodle" directory
  
  
Created an "ansible.tf" and configured the connection details where we are moving files related to ansible and playbooks 
  to instance in public-subnet-1 by using file provisioner and
  executing the shell script using "remote-exec provisioner"
  
  
Inside the ansible.sh script we are executing the playbook "play.yaml"
