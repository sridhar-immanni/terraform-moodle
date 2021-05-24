#! /bin/bash
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt install ansible -y

sudo cp /home/ubuntu/moodle.conf /etc/apache2/sites-available/
sudo ansible-playbook /home/ubuntu/moodle.yaml
sudo chown -R www-data:www-data /var/www/html/moodle/
sudo chmod -R 755 /var/www/html/moodle/
sudo chown www-data /var/www/html/moodledata

sudo a2enmod rewrite
sudo a2ensite moodle.conf
sudo systemctl restart apache2

