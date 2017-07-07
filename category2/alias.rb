file 'alias' do
  content                    'alias cpu=top | head -12 | tail -5 | awk '{print $9}' | sort -r'
  content                    'alias cpu=mem | head -12 | tail -5 | awk '{print $10}' | sort -r'
  content                    'alias ports=netstat -planet'
  path                      '/root/.bash_aliases'
  action                     :create 
end
