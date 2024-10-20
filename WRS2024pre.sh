#!/bin/bash
cd
sudo apt install git
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git pull
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
mkdir build
cd build
cmake .. -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
make
sudo make install
cd
cp choreonoid_env_setup/registration_preliminaries.yaml choreonoid/ext/WRS2024PRE/registration/registration_preliminaries.yaml
cp choreonoid_env_setup/registration_finals.yaml choreonoid/ext/WRS2024PRE/registration/registration_finals.yaml
cp choreonoid_env_setup/AizuSpiderDS.cnoid choreonoid/ext/WRS2024PRE/project/AizuSpiderDS.cnoid
cp choreonoid_env_setup/HobbyDrone.cnoid choreonoid/ext/WRS2024PRE/project/HobbyDrone.cnoid
