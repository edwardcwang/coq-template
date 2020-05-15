# Coq Project Template

This repo contains all files required for a basic project in Coq.

* `.gitignore` - gitignore for Coq projects.
* `_CoqProject` and `Makefile` - Makefile / Coq file to specify the project name and its files.
* `Options.v` - common options for the project.
* `MyProject.v` - main entry point for the project as a whole, when imported as a library.
* `Hello.v` - example project component, included in `MyProject.v`.

Run `make` to build all files, and run `coqide Hello.v` to open a file (e.g. `Hello.v` in the CoqIDE).
