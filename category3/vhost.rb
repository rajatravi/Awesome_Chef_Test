# For centos 7
package 'nginx' do
  package_name 'nginx'
end

git '/var/www/Opstree' do
   repository 'https://github.com/OpsTree/Site.git'
   revision 'opstree'
   action :checkout
   user 'root'
   group 'root'
end

git '/var/www/Techprimo' do
   repository 'https://github.com/OpsTree/Site.git'
   revision 'techprimo'
   action :checkout
   user 'root'
   group 'root'
end

directory '/etc/nginx/sites-available' do
  action :create
end

directory '/etc/nginx/sites-enabled' do
  action :create
end

file '/etc/nginx/sites-available/opstree.conf' do
  content 'server {
    listen  80;

    server_name opstree.com www.opstree.com;

    location / {
        root  /var/www/Opstree;
        index  index.html index.htm;
        try_files $uri $uri/ =404;
    }

}'
end

file '/etc/nginx/sites-available/techprimo.conf' do
  content 'server {
    listen  80;

    server_name techprimo.com www.techprimo.com;

    location / {
        root  /var/www/Opstree;
        index  index.html index.htm;
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
