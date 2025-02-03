# kxmx project generator

Generates a new project in a local directory for [kxmx bluemchen](https://github.com/recursinging/kxmx_bluemchen)-based Daisy Seed projects.

## Usage

From the root of this project run:

``` shell
./new_kxmx_project.sh
```

Provide a project name when prompted. Note that this will be used for the new directory and the C++ template file that is created.

For example,

``` shell
Enter the directory/project name: MyCoolNewProject
```

will result in the following project structure:

``` shell
.vscode
├── settings.json
└── tasks.json
kxmx_bluemchen
├── DaisySP
├── examples
├── libDaisy
├── src
├── .gitignore
├── .gitmodules
├── LICENSE
├── Makefile
├── README.md
.gitmodules
Makefile
MyCoolNewProject.cpp
```

Basic build tasks should be defined for use in VSCode. i.e. build, build_all, build_and_program, build_andprogram_dfu

## Current limitations

- location of this project and the destination of new projects are hard-coded to ```~/workspace``` which is great for my purposes, but will likely break for anyone else's local file structure
- only works for KXMX-based projects (hence the name, duh). would be awesome if it took an argument to specify which Daisy-based platform you're using and set up a project accordingly
