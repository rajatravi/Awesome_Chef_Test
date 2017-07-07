bash 'Insert 8.8.8.8' do
  code <<-EOH  
  File=/etc/resolv.conf
  string=8.8.8.8
  if grep -Fxq "${string}" ${File}
  then
   echo "the entry $string already present"
  else
    echo ${string} >> ${File}
  fi
  EOH
end
