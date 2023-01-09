#!/bin/bash
cd /var/www/html/
sudo cp magento2/magento.conf /etc/nginx/sites-enabled/magento.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo systemctl start nginx
sudo chmod -R 777 magento2/
sudo chown -R www-data:www-data magento2/
cd magento2/
php bin/magento setup:di:compile
php bin/magento setup:install --base-url=http://magento.rtd.squareops.co.in/ --db-host=magento-rds.rtd.squareops.co.in --db-name=magentodb --db-user=magento2 --db-password=password --admin-firstname=Magento --admin-lastname=User --admin-email=admin@mystore.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1 --backend-frontname="admin" --search-engine=elasticsearch7 --elasticsearch-host=magento-es.rtd.squareops.co.in --elasticsearch-port=9200
sudo chmod -R 777 magento2/var
