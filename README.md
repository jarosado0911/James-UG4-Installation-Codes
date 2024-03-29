# James-UG4-Installation-Codes

These are small shell scripts for installing ug4 on different operating systems.
There is also a pdf on how to manually install ug4 step by step, if you choose to install it this way disregard the parts where you need acces uni-frankfurt. 
You can also find directions [here](https://github.com/UG4/ughub) for installing
In general you will need the following:

** These are Requirements**

- C++ Compiler (tested with GCC on Linux, Clang on macOS and MSVC 2017 on Windows)
- CMake >= 2.8
- ughub (https://github.com/UG4/ughub)
- git
- python

# On Windows (tested on Windows 10)
You will need the following prerequisites for installation:
 - For installation on Windows you will need to use PowerShell which can be found [here](https://docs.microsoft.com/en-us/powershell/), follow the download and install instructions.
 - You will also need a recent versions of Visual Studio (VS 2017 or VS 2019) which can be found here: [visual studio](https://visualstudio.microsoft.com/)
 - You will also need cmake for Windows here [cmake](https://cmake.org/install/)
 - You will also need [Python](https://www.python.org/downloads/windows/)

You may need to add Python to the system path variable, information on how to do this is found [here](https://superuser.com/questions/949560/how-do-i-set-system-environment-variables-in-windows-10)

In the environment variables Python should already be there, if not you may need to add it.
If you installed Yale Neuron already, then it should already be in the path like in the figure below, if not you need to add it.

![pythonpath](images/pythonpath.PNG)

Steps to installing ug4 on Windows 10
1. Download the <code>UG4install.ps1</code> file and place it in the home directory of your user account. 
2. Open <code>PowerShell</code> command prompt and navigate to the folder that contains <code>UG4install.ps1</code> from Step 1.
3. Then execute <code>.\UG4install.ps1</code>
4. Then when Step 3. is complete, execute <code>ls</code>, in the directory there should be two folders called <code>ug4</code> and <code>ughub</code>
5. In <code>PowerShell</code> navigate to inside <code>ug4</code> and execute <code>ls</code> you should see below

![ug4folder](images/ug4folder.PNG)

6. Now open a Windows explorer window and navigate to the <code>build_vs</code> that is located inside <code>ug4</code>

![vsfolder](images/buildvs.PNG)

7. Open the <code>UG4.sln</code> in either VS2017 or VS2019 whichever one you have.
8. Choose 'Release' from the dropdown menu (both debug and release builds are possible from within Visual Studio)
9. Click Build->BuildSolution (F7) from the menu bar, this will take a while. ugshell.exe will be generated to bin/Release

Also see [here](https://github.com/UG4/ughub/issues/18) for any issue you may run into.

Another alternative is to compile with ninja makefiles is nice if you want to integrate your build into SublimeText or maybe also Eclipse. Note that ninja also requires an installation of Visual Studio. It is closer to the Unix workflow, that's why there may be less issues with running ugshell once it has been compiled.
On the other hand, Visual Studio project files can be generated with less hassle (no need to download ninja, no need to run vcvars64.bat) and can be easily compiled, too. Compiled executables are added to bin/Release instead of bin directly. This may cause some issues down the road when executing commands. Please report back if this leads to issue.
Since most developers of UG4 work with Unix systems, the Windows subsystem for Linux may be an interesting option, look [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10). 

# On MacOS
Need to add this

# On Linux (Ubuntu)
Need to add this
