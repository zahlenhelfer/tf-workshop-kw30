#!/bin/bash
sudo yum install httpd -y
sudo /sbin/chkconfig --levels 235 httpd on
sudo service httpd start
sudo instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
sudo region=$(curl http://169.254.169.254/latest/meta-data/placement/region)
sudo echo "<h1>$instanceId from $region</h1>" > /var/www/html/index.html