# skywater_unofficial_autoinstall

## Adam Lab Automatic Installation Script for the Skywater PDK and MPW-Precheck

[Official Precheck Documentation](https://github.com/efabless/mpw_precheck) <p>
[Official foss-asic-tools Docker](https://hub.docker.com/r/efabless/foss-asic-tools) <p>
[Official foss-asic-tools Documentation](https://github.com/efabless/foss-asic-tools) <p>
 
 
 The purpose of this script is to automate the installation of the skywater design environment provided by foss-asic.<p>
**This script can only be run on Linux and has been tested with Ubuntu 20.2**<p>
**This software installed uses about 15GB of storage**<p>
 All there is to do is install git, download the repository, and run 
```
sudo apt install git
git clone https://github.com/hen900/skywater_unofficial_autoinstall
cd skywater_unofficial_autoinstall
chmod +x install.sh
sudo ./install.sh
```
Users will have to give an installation directory path for precheck and skywater <p>
Upon complettion, the script will place a file named EFABLESS in the users Desktop Directory <p>
 
 ### Running efabless Environment
To start/access the docker environment, execute ~/Desktop/EFABLESS. <p>
It should be possible to execute the file from the desktop by double clicking or selecting "Run as a Program" <p>
A VNC connection will open to the design environment. Any files placed in /foss/designs inside VNC will appear locally in the design folder specified earlier in the installation<p>

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
