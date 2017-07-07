file '/etc/resolv.conf' do
  not_if '8.8.8.8' 
    content '8.8.8.8'
end
