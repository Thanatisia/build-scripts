# CONTRIBUTING

Please follow these steps when contributing to the repository.

## Some Steps to follow
 * Fork the repository to your account
 * Pull the latest changes to your main branch
 * Create a new branch named "author-your_changes"
 * Make changes
 * Commit to your branch
 * Create Pull Requests
    - Specify in your Pull Request
        * Date
        * Time
        * Author Name
        * Package Name
        * Target package manager
        * Base Distribution (OPTIONAL)
        * your changes made
        * Description and information to note


## Development
- Use similar variable naming convention schemes (pretty much good quality naming) for understandability
    - Examples
        + CC : stands for Cross Compiler, this is based off Makefile's use of the CC naming convention scheme, use this for all installers, make commands or compiler/builders.
        + CFLAGS : Stands for Compiler flags, this is also based off Makefile's compiler scheme, use this to indicate your installation/compilation flags
        + DEPENDENCIES : Self-explanatory, this is for all dependencies to install in your distribution

- Use comments if it's not a commonly-used function
    - Examples of Commonly-used Functions
        + compile()/build() : For running the manual compilation/installation process
        + install() : To install the source code using their provided makefile/build script.
        + clean()/cleanup() : For cleaning up the source code folder and removing temporary files generated from the compilation

## Filesystem Structure
- Please place the files into the appropriate folders
    - Version Number
        + Packages located under any of the distributed version control platforms [GitHub, GitLab, BitBucket, etc] typically have the source code for the latest version up, thus, they do not necessarily need to contain an addition ["version-number"] folder in the package manager
        + Packages located under 'others' will generally be placed in multi-versions, thus, those folders should contain an additional ["version-number"] folder in the package manager folder as shown in the repository structure.

## Templates
### Template Categories
> Please use the following templates for your scripts corresponding to the following header types
+ [GitHub](#github) : For all github-sourced/related repositories. These generally contains the latest build/version for the project.
+ [Others](#others) : For other distributed, remote repository websites (i.e. Bitbucket/Gitlab/self-hosted organization mirrors). These are typically seperated according to version numbers as the mirrors may seperate each release as version numbers within seperate folders.

### Components
> Generally, every template type should contain the following components
- Variables
    + CC : The global Cross Compiler. stemming from Makefile (make), this variable will contain the compiler/builder/runner/interpretor used to generate the program binary and/or script.
    + CFLAGS : (OPTIONAL) The global Compiler flags. stemming from Makefile (make), this variable will contain the flags to parse with the Cross Compiler. This is optional and can be left empty if the build script creator wishes to set individual compiler flags in the functions seperately.
- Functions
    + setup : The setup function, used for installing/building pre-requisites, definitions etc before the primary build/make process
    + build : The primary build/make/compilation process. This is where the general compilation is done after configurations are made.
    + install : The overall installation process of the built/compiled program into the system path and/or other dependencies and folders
    + clean : (Optional) This is the cleanup process/function done only after installation is completed. This can vary from 'make clean' to individual removal. This is up to the recommendation of the project repository maintainer and/or the build script creator if the maintainer did not specify.
    + main : This is the main launcher runner function that will execute each of the above sections to compile/build the program

### GitHub
```console
setup()
{

}

build()
{

}

install()
{

}

clean()
{

}

main()
{
    argv=("$@")
    argc="${#argv[@]}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
```

### Others
```console

```

## Wiki
### Terminologies
- BASH_SOURCE : in the template skeleton, you may realise that the templates (or most of my shellscripts in general) contains the following line
        ```console
        if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
            main "$@"
        fi
        ```
    * This is the equivalent to python's 
        ```python
        if __name__ == "__main__":
            main()
        ```
    - In that, this checks that the running script if the script itself
        + the code (in this case - main) will not be executed unless it is executed itself, and
        + the function will not be executed if it was sourced and/or called as a library/module.

### References
- Template Source Code
    - Please refer to the following folders for source code templates for the various styles
        + [Shellscript (current default)](docs/contributions/templates/python) for shellscript example
        + [Python (under development)](docs/contributions/templates/python) for python example

