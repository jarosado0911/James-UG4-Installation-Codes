cd $HOME
git clone https://github.com/UG4/ughub
cd $HOME/ughub
git pull
cd $HOME
Set-Item -Path Env:Path -Value($Env:Path + ";$HOME\ughub")
mkdir ug4
cd $HOME/ug4
ughub init
ughub install Examples
ughub addsource neurobox https://github.com/NeuroBox3D/neurobox-packages.git
cd plugins
ughub install cable_neuron neuro_collection MembranePotentialMapping Neurolucida SkinLayerGenerator
cd $HOME/ug4
cd apps
ughub install cable_neuron_app calciumDynamics_app MembranePotentialMapping_app NeurolucidaApp SkinLayerGeneratorApp
cd $HOME/ug4
<#[System.Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Java\jdk-14.0.2")#>
<#[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine) + ";$($env:JAVA_HOME)\bin")#>
mkdir build
cd build
cmake -DDIM=ALL -DCPU=1 -DSTATIC_BUILD=ON -DCMAKE_BUILD_TYPE=Release -DLAPACK=OFF -DBLAS=OFF -DEMBEDDED_PLUGINS=ON -DConvectionDiffusion=ON -DElectromagnetism=ON -DNavierStokes=ON -Dneuro_collection=ON -Dcable_neuron=ON -DMembranePotentialMapping=ON -DSmallStrainMechanics=ON ..
cd $HOME