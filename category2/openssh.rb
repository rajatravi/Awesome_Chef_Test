bash 'generate_SSH_Key' do  
code <<- SSH  
 sh-keygen -t rsa 
 ssh-copy-id localhost            
 chmod 600 .ssh/authorized_keys         
 SSH 
end
