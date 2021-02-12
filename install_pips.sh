#!/bin/sh

if [ ! -d ~/.pyvenv ]; then 
    echo_purple "creating python global venv"
    mkdir ~/.pyvenv
    python3 -m venv ${HOME}/.pyvenv
fi

if echo $PATH | grep -q .pyvenv; then
    echo_purple "upgrading pip"
    pip install --upgrade pip setuptools wheel

    echo_blue "installing python libs with pip"
    pip install ipython numpy scipy pygame matplotlib pyside2 pybind11 vtk
    pip install pyqt5 pyqtgraph pyopengl pyopengl_accelerate gnupg
    pip install pyopencl pytesseract tesserocr jupyter control
    pip install pylint autopep8
else
    echo_red "PATH does not contain ~/.pyvenv/bin"
    echo_red "Need to install dotfiles first and source ~/.termrc"
fi

echo_green "python libs installed"
