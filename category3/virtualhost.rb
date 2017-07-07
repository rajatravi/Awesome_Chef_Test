package 'install nginx' do
   package_name 'nginx'
   action  :install
end
file '/var/www/opstree.com/html/index.html' do
  content '<html>This is opstree.</html>'
  mode '0755'
end
file '/var/www/techprimo.com/html/index.html' do
  content '<html>This is techprimo.</html>'
  mode '0755'
end
bash 'copy file' do
    'sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/opstree.com'
    'sudo cp /etc/nginx/sites-available/opstree.com /etc/nginx/sites-available/techprimo.com'
end
file '/etc/nginx/sites-available/opstree.com' do
   content 'server {
        listen 80;
        listen [::]:80;

        root /var/www/opstree.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name opstree.com www.opstree.com;

        location / {
                try_files $uri $uri/ =404;
        }
}'
end
file '/etc/nginx/sites-available/techprimo.com' do
   content 'server {
        listen 80;
        listen [::]:80;

        root /var/www/techprimo.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name techprimo.com www.techprimo.com;

        location / {
                try_files $uri $uri/ =404;
        }
}'
end
link 'etc/nginx/sites-available/opstree.com' do
  to '/etc/nginx/sites-enabled/'
end
link 'etc/nginx/sites-available/techprimo.com' do
  to '/etc/nginx/sites-enabled/'
end
service 'nginx' do
  action :restart
end

