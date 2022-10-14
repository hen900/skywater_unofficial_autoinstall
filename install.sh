#Docker dependencies
apt-get -y remove docker docker-engine docker.io containerd runc
apt-get -y update
sudo apt-get -y install tigervnc-viewer
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \ 
    git \
    

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt-get -y update
  apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin gksu

got_path = 1;

while  ! [ got_path ]; do 
   printf "Enter desired Path for Design folder: "

    read -r design_PATH

    if ! [ -d "$design_PATH" ]; then
      echo "ERROR!,  ${design_PATH}... DOES NOT EXIST"
    else 
       got_path=0;
     fi
done
  
  mkdir $design_PATH
 
  export DESIGNS=$design_PATH
  
clear
echo "#### Pulling efabless image, this make take a while ####" 
sleep 2
  
docker pull efabless/foss-asic-tools:latest
  
  echo "## Adding shortcut on desktop... ###"
  printf "\nEnter username of non root main user: "
  read -r name
  cp ./EFABLESS /home/$name/Desktop
  chmod +x /home/$name/Desktop
  
clear 
echo " #### Installing MPW Precheck in home #### "
sleep 2
sudo apt -y install git make pip
clear

got_path = 1;
while  ! [ got_path ]; do 
    printf "Enter desired Path for Precheck installation folder: "

    read -r precheck_PATH

    if ! [ -d "$precheck_PATH" ]; then
      echo "ERROR!,  ${precheck_path}... DOES NOT EXIST"
    else 
       got_path=0;
     fi
done

cd precheck_PATH
git clone -b mpw-7a https://github.com/efabless/caravel_user_project_analog
cd caravel_user_project_analog 
make install











 
