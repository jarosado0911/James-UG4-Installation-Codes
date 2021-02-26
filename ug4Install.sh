#! /bin/bash
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
cd $HOME &&
echo "-------------------Updating .bash_profile----------------------" &&
echo 'PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin' >>~/.bash_profile &&
echo 'export PATH=$PATH:$HOME/project/ughub' >>~/.bash_profile &&
source $HOME/.bash_profile &&
echo "-------------------bash_profile updated!-----------------------" &&
echo "-------------------Making UG4 folder.--------------------------" &&
cd $HOME &&
mkdir ug4 &&
echo "-------------------UG4 folder made!----------------------------" &&
echo "-------------------Going into UG4 folder-----------------------" &&
cd $HOME/ug4 &&
echo "-------------------Initilizing ughub---------------------------" &&
ughub init &&
echo "-------------------ughub initilized!---------------------------" &&
echo "Available Packages:" &&
ughub list &&
ughub listsources &&
echo "-------------------Installing Examples-------------------------" &&
ughub install Examples &&
echo "-------------------Installing Examples Done!-------------------" &&
cd $HOME &&
echo "-------------------Updating .bash_profile----------------------" &&
echo 'export PATH=$PATH:$HOME/ug4/ugcore/scripts/shell/ugbash' >>~/.bash_profile &&
echo "-------------------bash_profile updated!-----------------------" &&
echo "-------------------Next Neuro Collection-----------------------" &&
cd $HOME/ug4 &&
ughub addsource neurobox https://github.com/NeuroBox3D/neurobox-packages.git &&
ughub list neurobox &&
cd $HOME/ug4/plugins &&
ughub install neuro_collection &&
ughub install cable_neuron &&
ughub install MembranePotentialMapping &&
ughub install Neurolucida &&
ughub install SkinLayerGenerator &&
ughub install electro_diffusion &&
cd $HOME/ug4/apps &&
ughub install MembranePotentialMapping_app &&
ughub install NeurolucidaApp &&
ughub install SkinLayerGeneratorApp &&
ughub install cable_neuron_app &&
ughub install calciumDynamics_app &&
echo "-------------------Going into UG4 folder-----------------------" &&
cd $HOME/ug4 &&
mkdir build &&
cd build &&
cmake -DCMAKE_BUILD_TYPE=Release -DLAPACK=OFF -DBLAS=OFF -DPARALLEL=OFF -DConvectionDiffusion=ON -DElectromagnetism=ON -DMembranePotentialMapping=ON -DNavierStokes=ON -Dcable_neuron=ON -Dneuro_collection=ON -DSmallStrainMechanics=ON .. &&
echo "-------------------Making This will take some time-------------" &&
make -j2 &&
cd $HOME &&
echo 'source $HOME/ug4/ugcore/scripts/shell/ugbash' >>~/.bash_profile &&
source $HOME/.bash_profile 