# skywater_unofficial_autoinstall

## Adam Lab Automatic Installation Script for the Skywater PDK and MPW-Precheck

https://github.com/efabless/mpw_precheck <p>
https://hub.docker.com/r/efabless/foss-asic-tools <p>
https://github.com/efabless/foss-asic-tools <p>
**This script can only be run on Linux and has been tested with Ubuntu 20.2**<p>
**This script uses about 15GB of storage**<p>
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
 
 ### Running efabless Environment
To start/access the docker environment, execute ~/Desktop/EFABLESS. <p>
It should be possible to execute the file from the desktop by double clicking or selecting "Run as a Program" <p>
A VNC connection will open to the design environment. Make sure to store all designs in the design folder specified earlier in the installation

### Running Precheck


Running precheck is a little peculiar, but it is straightforward. There is a “wrapper” file
located in caravel_user_project_analog/gds. The file is named
user_analog_project_wrapper.gds. The design is placed inside this file without
changing its name, and precheck is run from the command line using make.

Once a design has been placed inside this wrapper and saved, cd back to
caravel_user_project_analog/ and run the following command:
```
 sudo make run-precheck
```
