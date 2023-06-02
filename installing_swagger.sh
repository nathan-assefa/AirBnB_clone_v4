#!/usr/bin/env bash

# *********** 1st install python3-lxml ***********
sudo apt-get install -y python3-lxml
# first we need to install python3-lxml because python3-lxml is a library for processing XML and HTML in Python.
# and The python3-lxml package is required by Flasgger for processing XML and HTML. It provides functionality that Flasgger relies on, so it's important to have it installed to ensure Flasgger works correctly.

# If you skip the installation of python3-lxml, you might encounter errors or missing functionality when
# running your Flask application with Flasgger. It's generally recommended to follow the installation
# instructions provided to ensure all necessary dependencies are installed properly.

# *********** 2nd install flask_cors *******
sudo pip3 install flask_cors
# This command installs the flask_cors package using pip3, the package installer for Python.
# flask_cors is a Flask extension that provides Cross-Origin Resource Sharing (CORS) support.


# *********** 3rd install flasgger ************
sudo pip3 install flasgger
# This command installs the flasgger package using pip3. flasgger is a Flask extension that
# integrates Swagger into your Flask application, allowing you to generate API documentation
# based on the Swagger specification.
# you can use 'pip3 show flasgger' to check if it is successfuly installed

# If the RestAPI is not starting, please read the error message. Based on the(ses) error
# message(s), you will have to troubleshoot potential dependencies issues.
# Here some solutions:
# jsonschema exception
# $ sudo pip3 uninstall -y jsonschema 
# $ sudo pip3 install jsonschema==3.0.1
# No module named 'pathlib2'
# $ sudo pip3 install pathlib2
# These statements provide some potential solutions for specific error messages that you may
# encounter while starting the RestAPI with Flasgger. Let's break down each solution:

##########jsonschema exception:

#This solution suggests uninstalling the jsonschema package using sudo pip3 uninstall -y jsonschema.
# Then, it recommends installing a specific version of jsonschema (version 3.0.1) using 
# sudo pip3 install jsonschema==3.0.1.

##########No module named 'pathlib2':

# This solution suggests installing the pathlib2 package using sudo pip3 install pathlib2.
# These solutions are provided as troubleshooting steps for specific error scenarios related to the
# mentioned packages. If you encounter any of those error messages, you can try the respective
# solutions to resolve the issue.

# However, please note that these solutions are specific to the mentioned errors and may not be
# applicable or necessary for your particular situation. It's always recommended to carefully
# read the error messages and understand the root cause before applying any fix.


# if you are using vagrant and want to use the host machine browser, you can add this line
# to the 'vagrantfile' file so that if the request would be forwared to the virtual machine
# at the specified port number
# I expose the port 5001 of my vm to the port 5001 on my computer
#########config.vm.network :forwarded_port, guest: 5001, host: 5001 
