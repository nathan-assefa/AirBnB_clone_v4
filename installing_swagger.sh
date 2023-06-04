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



#******************** Port forwarding from host machine to virtual machine *****************
# If we are running 'vagrant virtula machine', and if we want to access the virtual machine
# mysql server in our host machine, we can execute this command in the host machine where the
# 'vagrantfile' is located using 'cmd'.
# this is the command**'vagrant ssh -- -L 3306:localhost:3306'*****************
# This command is used to establish the SSH tunnel and forward the MySQL port from the virtual
# machine to your local machine. This command sets up the port forwarding, allowing you to access
# the MySQL server running on the virtual machine through localhost on your host machine.
# Once you have established the SSH connection to your Vagrant virtual machine and forwarded the port,
# you can configure your Visual Studio Code to connect to the MySQL server running on the virtual machine.

# Here's what you can do in Visual Studio Code:

# 1. Install the "MySQL" extension for Visual Studio Code. You can search for it in the Extensions
# 	sidebar and install it.
# 2. Once the extension is installed, click on the "MySQL" icon in the
#	sidebar to open the MySQL view.
# 3. Click on the "+" button in the MySQL view to create a new connection.
# 4. In the connection settings, enter the following details:
	# .Name: Provide a name for the connection (e.g., Vagrant MySQL).
	# .Host: Enter localhost.
	# .Port: Enter 3306.
	# .User: Enter your MySQL username.
	# .Password: Enter your MySQL password.
	# .Click "Connect" to establish the connection to the MySQL server on your Vagrant virtual machine.
# Once the connection is established, you should be able to view and interact with your MySQL
# databases and tables within Visual Studio Code using the MySQL extension.

# Note: Make sure you have the necessary permissions and credentials to connect to the MySQL
# server on your Vagrant virtual machine.

# ***** you may have an error while you connect to the mysql server from host visual studio code
# when this happen use this solution
# The error message "MySQL client you are using does not support the authentication protocol
# requested by the MySQL server." This error commonly occurs when trying to connect to a MySQL
# server that uses the new authentication plugin introduced in MySQL 8.0.

# To resolve this issue, you have a few options:
# 1. Upgrade your MySQL client: You can try upgrading your MySQL client to a version that
#	supports the new authentication protocol. You can download the latest version of
#	MySQL Workbench or MySQL Command Line Client from the official MySQL website.

# 2. Update the authentication method on the MySQL server: If you have access to the MySQL server
#	configuration, you can update the authentication method to use the legacy authentication
#	plugin instead of the new one. This can be done by modifying the MySQL server configuration
#	file (typically my.cnf or my.ini) and adding the following line under the [mysqld] section:
#	*****************Copy code*************
#	"default_authentication_plugin=mysql_native_password"
#	After making the change, restart the MySQL server for the new configuration to take effect.

# 3. Create a new user with the old authentication method: If you cannot modify the MySQL server
# 	configuration, you can create a new user with the old authentication method and use that
#	user to connect. You can do this using the MySQL command line client by running the
#	following commands:
#	*****************Copy code************
#	CREATE USER 'new_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
#	GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost';
#	FLUSH PRIVILEGES;
#	Replace 'new_user' with the desired username and 'password' with the desired password.

# Try one of these options and see if it resolves the authentication issue.
