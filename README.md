# dotfiles 

Configuration for various utilities, managed with [GNU Stow](https://www.gnu.org/software/stow/)
following [this blog post](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

For each program there is a subdirectory that stores its config files, the
subdirectory being analogous to ` ~/` 

## Usage

Prerequisites: git, stow.

1. Check out repository, for exampe to `~/dotfiles` 
3. Let GNU stow link the config files  `$ find . -type d -execdir stow`

