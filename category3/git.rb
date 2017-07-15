git 'Cloning Repo and checkout branch master to opstree<F8>' do
   repository 'https://github.com/OpsTree/Site.git'
   revision 'opstree'
   destination '/var/www/Opstree'
   action :checkout
   user 'root'
   group 'root'
end

