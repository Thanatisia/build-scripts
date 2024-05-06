# CHANGELOGS

```
    The following are changes made to the repository.
```

## Table of Contents
+ [2023-12-03](#2023-12-03)
+ [2023-12-04](#2023-12-04)
+ [2024-01-06](#2024-01-06)
+ [2024-02-26](#2024-02-26)
+ [2024-03-06](#2024-03-06)
+ [2024-03-19](#2024-03-19)
+ [2024-03-20](#2024-03-20)
+ [2024-03-23](#2024-03-23)
+ [2024-03-31](#2024-03-31)
+ [2024-04-16](#2024-04-16)
+ [2024-04-19](#2024-04-19)
+ [2024-04-23](#2024-04-23)
+ [2024-05-03](#2024-05-03)
+ [2024-05-06](#2024-05-06)

## Updates

### Update 2022-11-01 2111H | v0.1.0
- Initial Commit
- Added CONTRIBUTING.md containing contribution steps
- Added README
- Added Neovim compile script for Debian-based apt
- Added pkglist.md containing all packages added to the list

### Update 2022-11-01 2111H | v0.1.1
- Updated README to add more usage steps
- Updated neovim apt compile script with added comments for 'Package Manager name'
- Added Neovim compile script for pacman package manager

### Update 2022-11-02 1047H | v0.1.1-update_1
- Updated README to include warning regarding direct piping

### Update 2022-11-02 2227H | v0.2.0
- Created a new 'author' directory for neovim
- Moved neovim package folder to 'neovim' author folder
- Updated README to specify testing changes such as
    - Having a author folder that will house the relevant projects so as to make indication and seperation of packages alot easier, as well as  potential collision prevention

### Update 2022-11-03 0012H | v0.3.0
- Added new folder layer 'version number' to seperate each version history (to be tested)
- Updated README to display the changes
- Added new package folder for the linux kernel (In Testing)
    - linux kernel v6.0.6

### Update 2022-11-03 1107H | v0.4.0
- Added new folder layer "repository-site" where it would contain various source code hosting sites such as
    - Distributed Remote Repository Sites: [GitHub, BitBucket]
    - Organization Self-Hosted Source Code Hosts: [linux etc]

### Update 2022-12-14 2332H | v0.4.1
- Added build scripts for packages 'tmux' and 'jdtls' from github

### Update 2023-07-07 2203H | added-new-projects
```
[New]
- Added new projects
    + davatorium/rofi
    + novnc/websockify
- Added 'dl_template.sh' to 'billw2/rpi-clone' to test its effectiveness when provided to individual projects as a standalone "Automated CLI script"

[Updates]
- Updated package list with new packages and new layout
- Updated README with new QoL improvements (WIP), tasks and usage examples
```

### 2023-12-03
#### 2307H
- New
    - Added new build scripts for packages and to be tested
        - Using apt
            - archlinux/devtools
            - pacman/pacman
- Updates
    - Updated package list with new packages

### 2023-12-04
#### 2258H
- Updates
    - Updated document 'README.md' in 'packages/gitlab/archlinux/devtools'
        - Added step to Build or Compile all targets using Makefile

### 2024-01-06
#### 1342H
- New
    - Added new apt project build scripts for github project 'baskerville/bspwm'
        - Temporarily using the pacman's single-file compile.sh system
    - Added new apt project build scripts for github project 'baskerville/sxhkd'
        - Temporarily using the pacman's single-file compile.sh system
- Updates
    - Updated package list with new packages

### 2024-02-26
#### 2016H
- New
    + Added new build scripts for 'sqlite/sqlite' in 'packages/others' using Makefile recipes (to be tested)

### 2024-03-06
#### 1715H
- Updates
    - Updated Makefile 'unix.Makefile' in 'packages/others/sqlite/sqlite/general/'
        + Fixed unit test and Configuration steps
    - Updated Makefile 'windows.Makefile' in 'packages/others/sqlite/sqlite/general/'
        + Added new dependenc(ies)
        + Fixed unit test and Configuration steps

### 2024-03-19
#### 2222H
- New
    - Added new directory 'Makefiles' in 'docs/contributions/templates/' to hold all Makefile templates for project builds
        - Added new directory 'GitHub' to hold all GitHub-based project source build Makefiles
            + Added new Makefile 'apt.Makefile' for apt-based installation
            + Added new Makefile 'pacman.Makefile' for pacman-based installation
    - Added new Makefile(s) to GitHub project 'neovim/neovim' in 'packages/github/neovim/neovim'
        + apt.Makefile    : apt-based Makefile to build from source in 1 file
        + pacman.Makefile : pacman-based Makefile to build from source in 1 file

- Updates
    + Aiming to decommission the current multi-script build system and modify to create a standard build repository using Makefile
    - Updated document 'CONTRIBUTING.md'
        + Added variables, Instructions/Recipe/Targets for a Makefile-based build script
        + Added snippet/templates for a build from source Makefile

#### 2247H
- Updates
    - Updated gitlab project 'archlinux/devtools'
        + Added dependencies
        + Added install function to build script 'start.sh'

### 2024-03-20
#### 0942H
- Updates
    - Updated GitHub project 'git/git'
        + Added dependencies

#### 1425H
- New
    - Added new directory 'Makefiles' to GitHub package 'git/git' in 'packages/github/git/git' to hold the Makefile build scripts
        + Added new Makefile 'apt.Makefile' for building 'git/git' using apt-based package management
        + Added new Makefile 'pacman.Makefile' for building 'git/git' using pacman-based package management

#### 1434H
- Updates
    - Updated documents 'apt.Makefile' and 'pacman.Makefile' in 'docs/contributions/templates/Makefiles/GitHub/'
        + Added targets/instructions and variables for building projects from source based on the maintainer/project author's instructions

#### 1444H
- Updates
    - Updated document 'CONTRIBUTING.md'
        + Added explanation and example usage of the Makefile template recipe/targets

#### 1711H
- Updates
    - Updated Makefile 'pacman.Makefile' for GitHub package 'git/git' in 'packages/github/git/git/Makefiles'
        + Fixed dependencies and
        + Fixed target 'install-depedenncies'

#### 1814H
- Updates
    - Updated Makefile 'pacman.Makefile' for GitHub package 'neovim/neovim' in 'packages/github/neovim/neovim/Makefiles'
        + Fixed dependencies and
        + Fixed target 'install-depedencies'

#### 1815H
- New
    + Added new directory 'Makefiles' in 'packages/github/neovim/neovim/'

- Updates
    + Migrated 'apt.Makefile' and 'pacman.Makefile' in 'packages/github/neovim/neovim/' to 'packages/github/neovim/neovim/Makefiles'

### 2024-03-23
#### 1413H
- Updates
    - Updated Makefile 'apt.Makefile' for GitHub package 'neovim/neovim' in 'packages/github/neovim/neovim/Makefiles'
        + Fixed target 'install-depedencies'
    - Updated Makefile 'apt.Makefile' for GitHub package 'git/git' in 'packages/github/git/git/Makefiles'
        + Fixed target 'install-depedencies'

#### 1417H
- Updates
    - Updated Makefile example template 'apt.Makefile' in 'docs/contributions/templates/Makefiles/GitHub/'
        + Added new targets to .PHONY
        + Fixed dependencies call in 'install-dependencies'
    - Updated Makefile example template 'pacman.Makefile' in 'docs/contributions/templates/Makefiles/GitHub/'
        + Added new targets to .PHONY
        + Fixed dependencies call in 'install-dependencies'

#### 1422H
- Updates
    - Updated document 'CONTRIBUTING.md'
        + Fixed Makefile template configurations

### 2024-03-31
#### 0243H
- New
    + Added new Makefile "pkg.Makefile" in package "neovim/neovim" for Termux package manager "pkg"

### 2024-04-16
#### 2214H
- New
    - Added new directory GitHub project author 'rust-lang' in 'packages/github/'
        - Added new repository directory 'cargo' for the Rust Package Manager project repository
            - Added new directory 'Makefiles' for storing all Makefiles
                + Added new Makefile 'apt.Makefile' for apt-based distributions
        - Added new repository directory 'rust' for the Rust compiler/toolchain project repository
            - Added new directory 'Makefiles' for storing all Makefiles
                + Added new Makefile 'apt.Makefile' for apt-based distributions

- Updates
    - Updated document 'pkglist.md'
        + Added new GitHub package

### 2024-04-19
#### 1058H
- New
    + Added new Makefile 'pacman.Makefile' to 'rust-lang/rust' for pacman support

- Updates
    - Updated document 'pkglist.md'
        + Updated supported Package Manager to package 'rust-lang/rust'

### 2024-04-23
#### 2207H
- New
    - Added new directory GitHub project author 'artempyanykh' in 'packages/github/'
        - Added new repository directory 'marksman' for the Markdown LSP server project repository
            - Added new directory 'Makefiles' for storing all Makefiles
                + Added new Makefile 'apt.Makefile' for apt-based distributions
                + Added new Makefile 'pacman.Makefile' for pacman-based distributions

- Updates
    - Updated document 'pkglist.md'
        + Updated supported Package Manager to package 'artempyanykh/marksman'

### 2024-05-03
#### 1104H
- New
    - Added new directory GitHub project author 'fastfetch-cli' in 'packages/github/'
        - Added new repository directory 'fastfetch' for the system information fetch CLI utility like neofetch but written mostly in C
            + Added new document 'README.md'
            - Added new directory 'Makefiles' for storing all Makefiles
                + Added new Makefile 'apt.Makefile' for apt-based distributions
                + Added new Makefile 'pacman.Makefile' for pacman-based distributions
                + Added new Makefile 'pkg.Makefile' for termux (pkg)-based distributions

- Updates
    - Updated document 'pkglist.md'
        + Updated supported Package Manager to package 'fastfetch-cli/fastfetch'

### 2024-05-06
#### 1107H
- New
    - Added new directory 'Makefiles' in 'packages/others/suckless/slock' for holding Makefile recipes to building slock from source
        + Added new Makefile 'apt.Makefile' for apt-based distributions
        + Added new Makefile 'pacman.Makefile' for pacman-based distributions
        + Added new Makefile 'pkg.Makefile' for termux (pkg)-based distributions
    - Added new directory 'Makefiles' in 'packages/others/suckless/dmenu' for holding Makefile recipes to building dmenu from source
        + Added new Makefile 'apt.Makefile' for apt-based distributions
        + Added new Makefile 'pacman.Makefile' for pacman-based distributions
        + Added new Makefile 'pkg.Makefile' for termux (pkg)-based distributions
- Updates
    - Updated document 'README.md' in 'packages/others/suckless/slock'
        + Added package dependencies
    - Updated document 'README.md' in 'packages/others/suckless/dmenu'
        + Added package dependencies

#### 2331H
- New
    - Added new repository directory 'rust-analyzer' in 'packages/github/rust-lang' for the Rust Language Server Protocol (LSP) Pack
        + Added new document 'README.md'
        - Added new directory 'Makefiles' for storing all Makefiles
            + Added new Makefile 'apt.Makefile' for apt-based distributions
            + Added new Makefile 'pacman.Makefile' for pacman-based distributions
- Updates
    - Updated document 'pkglist.md'
        + Updated supported Package Manager to package 'rust-lang/rust-analyzer'

