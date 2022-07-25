# Emacs daedalus-mode
This is an attempt to create a daedalus-mode for emacs. Later to be used with [Daedalus Language Server](https://github.com/Kirides/DaedalusLanguageServer)

## Currently supports

- syntax highlighting
- yas-snippets
  - if
  - func
  - C_INFO dialogues
- auto indentation (derived from c-mode)

## Installation
Since this is a very early, and I don't really know how to prepare an Emacs package for easy install, I have the files in a separate folder in `~/.emacs.d/my-packages` directory.


The files are placed in 
```elisp
(add-to-list 'load-path "~/.emacs.d/my-packages")
(load "daedalus.el") ; the code for daedalus-mode
```

You will also have to add the path to yas-snippets, like so:
```elsip
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '(.emacs.d/my-packages/daedalus-snippets)))
```
