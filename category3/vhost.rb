apt_package 'nginx' do
  package_name 'nginx'
  provider  Chef::Provider::Package::Apt
  version  '1.4.6-1ubuntu3.7'
 action :install
end

git 'clone' do
   repository 'git@github.com:OpsTree/Site.git'
   revision 'opstree'
   action :checkout
   destination '/home/vagrant/git/opstree'
   user 'root'
end

git 'clone_tech' do
   repository 'git@github.com:OpsTree/Site.git'
   revision 'techprimo'
   action :checkout
   destination '/home/vagrant/git/techprimo'
   user 'root'
end

#file '/var/www/opstree.com/html/index.html' do
## content '<html>This is opstree.</html>'
## mode '0755'
##end
##file '/var/www/techprimo.com/html/index.html' do
## content '<html>This is techprimo.</html>'
## mode '0755'
##end
##bash 'copy file' do
##   'sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/opstree.com'
# #  'sudo cp /etc/nginx/sites-available/opstree.com /etc/nginx/sites-available/techprimo.com'
# #end

file '/etc/nginx/sites-available/opstree.conf' do
  content 'server {
listen 80;
       listen [::]:80;

       root /home/vagrant/git/opstree;
       index index.html index.htm index.nginx-debian.html;

       server_name opstree.com www.opstree.com;

       location / {
               try_files $uri $uri/ =404;
       }
}'
end

file '/etc/nginx/sites-available/techprimo.conf' do
  content 'server {
       listen 80;
       listen [::]:80;
       root  /home/vagrant/git/techprimo;
       index index.html index.htm index.nginx-debian.html;

       server_name techprimo.com www.techprimo.com;

       location / {
               try_files $uri $uri/ =404;
       }
}'
end

link '/etc/nginx/sites-available/opstree.conf' do
 to '/etc/nginx/sites-enabled/opstree.conf'
link_type :symbolic
end

link '/etc/nginx/sites-available/techprimo.conf' do
 to '/etc/nginx/sites-enabled/techprimo.conf'
link_type :symbolic
end

service 'nginx' do
 action :restart
end
