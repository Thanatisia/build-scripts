# CONTRIBUTING

Please follow these steps when contributing to the repository.

## Some Steps to follow
 * Fork the repository to your account
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


