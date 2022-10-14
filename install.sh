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
  
  printf "Enter desired Path for design folder: "
  
  read -r design_PATH
  
  mkdir $design_PATH
 
  export DESIGNS=$design_PATH
  
clear
echo "#### Pulling efabless image, this make take a while ####" 
sleep 2
  
docker pull efabless/foss-asic-tools:latest
  
  
clear 
echo " #### Installing MPW Precheck in home #### "
sleep 2
mkdir 


 
