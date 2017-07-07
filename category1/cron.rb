cron 'cron job' do
 command 'echo 3 >/proc/sys/vm/drop_caches'
 minute  '0'
 hour    '3'
 action :create
end
