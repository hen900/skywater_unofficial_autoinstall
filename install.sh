#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "FATAL ERROR: Must run as root user ... "
  echo "Exiting..."
  exit
fi
                                                                                                          

printf "\nRunning autoinstall script...\n"

apt-get -y update

#Required Dependencies

apt install ca-certificates lsb-release make python3-pip xtightvncviewer gvncviewer  docker.io




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

gsettings set org.gnome.nautilus.preferences executable-text-activation 'launch'

echo "## Adding shortcut to desktop... ###"
printf "\nEnter username of non root main user: "
read -r name



sed -i "s/CHSN_PATH/$design_PATH/g"./EFABLESS 

sed -i "s/NAME/$name/g"./EFABLESS 

cp ./EFABLESS /home/$name/Desktop/EFABLESS

chmod +x /home/$name/Desktop/EFABLESS
chown $name:$name /home/$name/Desktop/EFABLESS

 

echo "#### Pulling efabless image, this make take a while ####" 
sleep 2
docker pull efabless/foss-asic-tools:beta

useradd $name docker
echo " #### Installing MPW Precheck  #### "
sleep 2



f=1
while [ $f -eq 1 ] ; do 
   printf "Enter desired path for precheck folder: "

    read -r precheck_PATH
    ## Remove spaces in case user added them
    precheck_PATH="$(echo "${precheck_PATH// /}")" 
    

    if ! [ -d "$precheck_PATH" ]; then
      echo "ERROR $precheck_PATH... DOES NOT EXIST"
    else 
       f=0
     fi
done

#installing precheck

mkdir $precheck_PATH/pdks


#using the pdk already downloaded for the efabless design environment
echo "Copying pdk..."

cp -R /var/lib/docker/overlay2/*/diff/foss/pdks/  $precheck_PATH/pdks



cd $precheck_PATH
git clone -b mpw-7a https://github.com/efabless/caravel_user_project_analog
cd caravel_user_project_analog 
sed -i "1i export PDK_ROOT?=/$precheck_PATH/pdks/" Makefile
make install
printf "\n\n\n##### DONE #####\n"


 
