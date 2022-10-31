# skywater_unofficial_autoinstall

## Adam Lab Automatic Installation Script for the Skywater PDK and MPW-Precheck

https://github.com/efabless/mpw_precheck <p>
https://hub.docker.com/r/efabless/foss-asic-tools <p>
https://github.com/efabless/foss-asic-tools <p>
This script is expected to be run on Linux and has been tested with Ubuntu 20.2

All there is to do is install git, download the repository, and run 
```
sudo apt install git
git clone https://github.com/hen900/skywater_unofficial_autoinstall
cd skywater_unofficial_autoinstall
chmod +x install.sh
sudo ./install.sh
```
Users will have to give an installation directory path for precheck and skywater <p>
Users will also set the password for the PDK environment <p>
Upon complettion. the script will place a file named start_environment in the users Desktop Directory <p>
To start/access the docker environment, execute ~/Desktop/start_environment. <p>
A VNC connection will open to the design environment. Make sure to store all designs in the design folder specified earlier in the installation
