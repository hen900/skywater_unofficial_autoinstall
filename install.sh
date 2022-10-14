#Docker dependencies
apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \ 
    git \
    

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt-get update
  apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

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
  
  
clear 
echo " #### Installing MPW Precheck in home #### "
sleep 2
sudo apt install git make docker.io pip
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

cd precheck_PATH






 
