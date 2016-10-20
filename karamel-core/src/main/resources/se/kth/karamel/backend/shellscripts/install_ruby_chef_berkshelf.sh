echo $$ > %pid_file%; echo '#!/bin/bash

if [ %osfamily% == "redhat" ] ; then
if [ -f chefdk-0.8.0-1.el6.x86_64.rpm ] ; then
  checksum=`sha256sum chefdk-0.8.0-1.el6.x86_64.rpm | grep -o '^\S\+'`
  if [ "$checksum" != "554b087a78e66bab17703ffef1d688dd86eeb7b5ea00b65dc2ca07f9f0ab0077" ] ; then
      rm -f chefdk-0.8.0-1.el6.x86_64.rpm 
      wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.8.0-1.el6.x86_64.rpm 
  fi
else
   wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.8.0-1.el6.x86_64.rpm 
fi
%sudo_command% yum install -y chefdk-0.8.0-1.el6.x86_64.rpm 
echo '%task_id%' >> %succeedtasks_filepath%

elif [ %osfamily% == "ubuntu" ] ; then

if [ -f chefdk_0.12.0-1_amd64.deb ] ; then
  checksum=`sha256sum chefdk_0.12.0-1_amd64.deb | grep -o '^\S\+'`
  if [ "$checksum" != "6fcb4529f99c212241c45a3e1d024cc1519f5b63e53fc1194b5276f1d8695aaa" ] ; then
      rm -f chefdk_0.12.0-1_amd64.deb
      wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.12.0-1_amd64.deb
  fi
else
   wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.12.0-1_amd64.deb
fi
%sudo_command% dpkg -i chefdk_0.12.0-1_amd64.deb && echo '%task_id%' >> %succeedtasks_filepath%
echo \"Found ubuntu\"
else 
 echo "Unrecognized version of linux. Not ubuntu or redhat family."
 exit 1
fi
echo '%task_id%' >> ~/%succeedtasks_filepath%
' > berks-install.sh ; chmod +x berks-install.sh ; ./berks-install.sh
