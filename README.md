# mcserver-gcp-shell
ZSH script for deploying a Minecraft server on Google Cloud Shell for free

Requirements:

- A gmail account
- A playit.gg account


1. Go to your Google Cloud Console

https://console.cloud.google.com


2. Open the web terminal (at the top right)


3. Clone the repository into your home directory:

        git clone https://github.com/serroml/mcserver-gcp-shell.git


4. Edit the .bashrc file, just type the following:

        cat ~/github/mcserver-gcp-shell/check_zsh.txt >> .bashrc
        
        
5. With this change every time you start the server it will take a few seconds until you can type in your web terminal


7. Now move the zsh script and the docker-compose to your home directory

       mv ~/mc-server-gcp-shell* ~/


8. Assign execution permissions to the script with:

       chmod u+x mcserver.sh
       

9. Now you can run your server, run the script with:

       ./mcserver.sh --start


10. You can stop the server with:

        ./mcserver.sh --stop


The script will only work correctly when you have an account at https://playit.gg, logged in and created the tunnel in your playit.gg account.

The docker-compose file contains the configuration of how the container will be created to run for your server, if you want to run a specific version you must edit it and change the version you want by editing the line "VERSION: ".
