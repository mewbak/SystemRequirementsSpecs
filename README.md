# About
This repository contains the LaTeX code for the OpenDiablo2 System Requirements Specification.

## Software Toolchain (required to generate a PDF)
The software toolchain used to build this document is TeXLive. TeXLive is a TeX environment for processing LaTeX files; it is cross-compatible, open-source, and free. There is a distribution available for MacOS, Windows, and Linux.

On Windows and Linux, install [**TeXLive**](https://www.tug.org/texlive/acquire.html).

On MacOS, install [**MacTeX**](https://tug.org/mactex/mactex-download.html).

For an IDE to edit, compile, and debug this source code [TeXWorks](http://www.tug.org/texworks/) is recommended. There is an installation file provided for MacOS, Windows, and Linux.

## Build Instructions
In TeXWorks, open the .tex file in the root of this repository. Change the build engine from `pdflatex` to `lualatex`, and hit the `typeset` button.

## Building from Command Line
There is an included makefile in the root of this repository. **you will need a c/c++ compiler toolchain to use the makefile**. Linux and MacOS will have this readily available, but Windows users will need to install [MinGW](https://sourceforge.net/projects/mingw/).

There are three make rules; `all`, `clean`, and `secure`.

To use the makefile, navigate to this repository directory in your shell and issue the command `make <RULE>`, where `<RULE>` is one of the rules above.

The `all` rule is the default, and 
will re-build the entire document from scratch (removing previous builds).

The `clean` rule will simply remove previous builds. 

The `secure` rule will rebuild, generate an encrypted and password-secured version of the pdf output, and then remove the unsecured build from the output directory. During this `secure` rule, you will be prompted for two passwords; one is for the document owner, and one is for the document user. The `user password` is the password that should be distributed to whomever you share the document. The secured document will appear in the root of the repository.
