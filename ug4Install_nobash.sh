#!/bin/bash
echo "--------------------Checking for xcode-select------------------" &&
command -v xcode-select >/dev/null 2>&1 || { echo >&2 "I require xcode-select but it's not installed, please install.  Aborting."; exit 1; } &&
echo "xcode-select installed = YES!" &&
echo "--------------------Checking for cmake-------------------------" && 
command -v cmake >/dev/null 2>&1 || { echo >&2 "I require cmake but it's not installed, please install.  Aborting."; exit 1; } &&
echo "cmake installed = YES!" &&
echo "Taking you to $HOME." &&
cd $HOME &&
echo "Now in $HOME." &&
echo "------------------------Cloning ug4 repo!----------------------" &&
git clone https://github.com/UG4/ughub &&
echo "-------------------ug4 repo cloned successfully!---------------" &&
echo "-------------------Now updating local repo!--------------------" &&
cd $HOME/ughub &&
git pull &&
echo "-------------------Update successful!--------------------------" &&
echo "-------------------Making UG4 folder.--------------------------" &&
cd $HOME &&
mkdir ug4 &&
echo "-------------------UG4 folder made!----------------------------" &&
echo "-------------------Going into UG4 folder-----------------------" &&
cd $HOME/ug4 &&
echo "-------------------Initilizing ughub---------------------------" &&
$HOME/ughub/ughub init -f &&
echo "-------------------ughub initilized!---------------------------" &&
echo "Available Packages:" &&
$HOME/ughub/ughub list &&
$HOME/ughub/ughub listsources &&
echo "-------------------Installing Examples-------------------------" &&
$HOME/ughub/ughub install Examples &&
echo "-------------------Installing Examples Done!-------------------" &&
echo "-------------------Next Neuro Collection-----------------------" &&
cd $HOME/ug4 &&
$HOME/ughub/ughub addsource neurobox https://github.com/NeuroBox3D/neurobox-packages.git &&
$HOME/ughub/ughub list neurobox &&
cd $HOME/ug4/plugins &&
$HOME/ughub/ughub install neuro_collection &&
$HOME/ughub/ughub install cable_neuron &&
$HOME/ughub/ughub install MembranePotentialMapping &&
$HOME/ughub/ughub install Neurolucida &&
$HOME/ughub/ughub install SkinLayerGenerator &&
$HOME/ughub/ughub install electro_diffusion &&
cd $HOME/ug4/apps &&
$HOME/ughub/ughub install MembranePotentialMapping_app &&
$HOME/ughub/ughub install NeurolucidaApp &&
$HOME/ughub/ughub install SkinLayerGeneratorApp &&
$HOME/ughub/ughub install cable_neuron_app &&
$HOME/ughub/ughub install calciumDynamics_app &&
echo "-------------------Going into UG4 folder-----------------------" &&
cd $HOME/ug4 &&
mkdir build &&
cd build &&
cmake -DSTATIC_BUILD=ON -DEMBEDDED_PLUGINS=ON -DCMAKE_BUILD_TYPE=vrl -DLAPACK=OFF -DBLAS=OFF -DPARALLEL=OFF -DConvectionDiffusion=ON -DElectromagnetism=ON -DMembranePotentialMapping=ON -DNavierStokes=ON -Dcable_neuron=ON -DCNCpp11Features=OFF -Dneuro_collection=ON -DSmallStrainMechanics=ON -DLuaShell=ON .. &&
echo "-------------------Making This will take some time-------------" &&
make -j8 &&
cd $HOME &&
echo "Done Installation!"