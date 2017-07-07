apt_update 'update' do
   action  :update 
end
package 'install given package' do
 package_name ['net-tools','openssh server','htop']
 action :install
end
