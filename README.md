# mcserver-gcp-shell
ZSH script for deploying a Minecraft server on Google Cloud Shell for free

Requirements:

- A gmail account
- A playit.gg account


1. Go to your Google Cloud Console

https://console.cloud.google.com


2. Open the web terminal (at the top right)


3. Edit your .bashrc with the following:


        cat ~/check_zsh.txt >> .bashrc


4. With this change every time you start the server it will take a few seconds until you can type in your web terminal


5. Clone the repository into your home directory and move the ZSH script and 


6. Now move the zsh script and the docker-compose to your home directory

       mv ~/mc-server-gcp-shell* ~/

7. Assign execution permissions to the script with:

       chmod u+x mcserver.sh

8. Now you can run your server, run the script with:

       ./mcserver.sh --start

9. You can stop the server with:

       ./mcserver.sh --stop

The script will only work correctly when you have created a playit.gg account, logged in and created the tunnel in your playit.gg account.

The docker-compose file contains the configuration of how the container will be created to run for your server, if you want to run a specific version you must edit it and change the version you want by editing the line "VERSION: ".
