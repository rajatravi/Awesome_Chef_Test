user 'rajat' do
  home '/home/vagrant'
  shell '/bin/bash'
  password '######@@@@@@'
end

group "add above userin sudo group" do
  group_name 'sudo'
  members 'rajat'
  action :modify
  append true
end
