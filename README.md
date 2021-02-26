# James-UG4-Installation-Codes

These are small shell scripts for installing ug4 on different operating systems.
There is also a pdf on how to manually install ug4 step by step. In general you will need the following:

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

You made need to add Python to the system path variable, information on how to do this is found [here](https://superuser.com/questions/949560/how-do-i-set-system-environment-variables-in-windows-10)

In the environment variables Python should already be there, if not you may need to add it.

![pythonpath](images/pythonpath.PNG) 