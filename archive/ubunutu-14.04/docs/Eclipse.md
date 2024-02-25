# Eclipse

Primer for setting up Eclipse CDT on an existing codebase.

## Installation

Download Eclipse CDT, then untar.  Rename the directory to track which version
has been installed in case you need to rollback on upgrade.


## Configuring a project with special include paths (project preferences)
C/C++ Build
*   set instructions for build if not using make
C/C++ General, Paths and Symbols
*   add other include paths (project, others)
## Workspace Preferences (skip this step if you imported settings)
General, Editors, Text Editors
set num cols, spaces for tabs, tab width, add line numbers, trailing whitespace
chars
C/C++
*   Editor - Set Doxygen Comments: Workspace default dropdown, select doxygen
*   Code Style - adjust to whatever you like for spacing
*   Code Templates - set up header / source / test boilerplate

## C++ 11

Window, preferences, C/C++, build, settings, “discovery” tab
*   click button “CDT GCC Built -in compiler settings”
*   add “--std=c++11” to the command to enable c++11 during auto-detection
