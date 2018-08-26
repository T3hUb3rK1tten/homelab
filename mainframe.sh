# Proper steps to bootstrap the Apache2 mainframe reverse proxy for Let's Encrypt + checkauth.py
sudo su
apt update
apt install apache2 libapache2-mod-authnz-external install software-properties-common python-requests
apt update
add-apt-repository ppa:certbot/certbot
apt install python-certbot-apache

mv 0-server.conf 0-ssl.conf security.conf /etc/apache2/conf-available/
mv auth.inc.conf dyn-ssl.inc.conf /etc/apache2/
mv reverse-dyn.conf /etc/apache2/sites-available/

a2enmod authn_socache socache_shmcb ssl rewrite auth_form session_cookie proxy request headers
echo "ServerName example.com" > /etc/apache2/conf-available/fqdn.conf
a2enconf fqdn 0-server security
service apache2 start

certbot certonly --webroot --webroot-path /var/www/html/ -d dyn.ub3rk1tten.com -d www.dyn.ub3rk1tten.com -d couchpotato.dyn.ub3rk1tten.com -d garage.dyn.ub3rk1tten.com -d guacamole.dyn.ub3rk1tten.com -d plex.dyn.ub3rk1tten.com -d seedbox.dyn.ub3rk1tten.com -d sonarr.dyn.ub3rk1tten.com -d pfsense.dyn.ub3rk1tten.com  -d commafeed.dyn.ub3rk1tten.com -d librenms.dyn.ub3rk1tten.com -d m.mwe.st -d pvwa.dyn.ub3rk1tten.com -d epm.dyn.ub3rk1tten.com -d crl.dyn.ub3rk1tten.com -d unifi.dyn.ub3rk1tten.com -d edgerouter.dyn.ub3rk1tten.com -d hassio.dyn.ub3rk1tten.com -d mqtt.dyn.ub3rk1tten.com -d dnsmasq.dyn.ub3rk1tten.com -d amcrest-1.dyn.ub3rk1tten.com

a2enconf 0-ssl 
a2dissite 000-default.conf
a2ensite reverse-dyn.conf