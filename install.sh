#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "FATAL ERROR: Must run as root user ... "
  echo "Exiting..."
  exit
fi
                                                                                                          
if  ! [ "$(apt -h)" ]
  then echo "FATAL ERROR: pacakge manager apt required ... "
  echo "Exiting..."
exit
fi


printf "\nRunning autoinstall script...\n"

apt  -y update

#Required Dependencies

apt install ca-certificates lsb-release make python3-pip xtightvncviewer gvncviewer tigervnc-common tigervnc-tools docker.io 



if  ! [ "$(docker -version)" ]
  then echo "FATAL ERROR: docker failed to install ... "
  echo "Exiting..."
  exit
  
fi





printf "Enter desired name (not path) for skywater design folder: "
read -r sky_NAME
f=1
while [ $f -eq 1 ] ; do 
   printf "Enter desired path for design folder: "

    read -r design_PATH
    ## Remove spaces in case user added them
    design_PATH="$(echo "${design_PATH// /}")" 
    

    if ! [ -d "$design_PATH" ]; then
      echo "ERROR $design_PATH... DOES NOT EXIST"
    else 
       design_PATH="$(echo "$design_PATH/$sky_NAME/")" 
       f=0
     fi
done


mkdir $design_PATH
export DESIGNS=$design_PATH

#Makes it so that executables can be run from GUI (only works for ubuntu gnome)
gsettings set org.gnome.nautilus.preferences executable-text-activation 'launch'

echo "## Adding shortcut to desktop... ###"
printf "\nEnter username of non root main user: "
read -r name


#Loads in custom params into startup file

sed  -i "s|CHSN_PATH|${design_PATH}|g" ./EFABLESS
sed  -i "s|NAME|${name}|g" ./EFABLESS

cp ./EFABLESS /home/$name/Desktop/EFABLESS
chmod +x /home/$name/Desktop/EFABLESS
chown $name:$name /home/$name/Desktop/EFABLESS

 

echo "#### Pulling efabless image, this make take a while ####" 
sleep 2
docker pull efabless/foss-asic-tools:beta

#Generates vncpasswd file 
printf "yh288hG5k\nyh288hG5k\nn\n" | tigervncpasswd /home/$name/.vncpass


#adds user to docker group to avoid running as root
adduser $name docker

echo " #### Installing MPW Precheck  #### "
sleep 2

chmod +x ./precheck_helper



#install precheck as user 
curr_PATH="$(pwd)"
runuser -l $name -g docker -c "$curr_PATH/precheck_helper $design_PATH"

#fixes ownership of files created by root
chown -R $name:$name /home/$name

printf 'To complete the installation, you must Reboot. Would you like to reboot now? (y/n): ' && read x && [[ "$x" == "y" ]] && /sbin/reboot; 
printf "\n\n\n##### DONE #####\n"


 
