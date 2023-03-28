# mcserver-gcp-shell
ZSH script for deploying a Minecraft server on Google Cloud Shell for free

Requirements:

- A gmail account
- A playit.gg account


1. Go to your Google Cloud Console

https://console.cloud.google.com


2. Open the web terminal (at the top right) and install ZSH, you will only have to do this once, thanks to step 5 this will be done automatically the next time you open the console.

        sudo apt update && sudo apt install zsh -y


3. Clone the repository into your home directory:

        git clone https://github.com/serroml/mcserver-gcp-shell.git


4. Now move the zsh script and the docker-compose to your home directory

       mv ~/mcserver-gcp-shell/* ~/
       

5. Edit the .bashrc file, just type the following:

        cat ~/check_zsh.txt >> ~/.bashrc
        
        
With this change every time you start the server it will take a few seconds until you can type in your web terminal


6. Download playit in your home directory:

        wget https://github.com/playit-cloud/playit-agent/releases/download/v0.9.3/playit-0.9.3


7. Assign execution permissions to the ZSH script and the playit executable.

        chmod u+x mcserver.zsh playit


The script has only two options:

        your-user@cloudshell:~$ ./mcserver.zsh

        [!] Help: ./mcserver.zsh [--start] [--stop]
        
        

9. Now you can run your server, run the script with:

       ./mcserver.zsh --start


10. You can stop the server with:

        ./mcserver.zsh --stop


The script will only work correctly when you have an account at https://playit.gg, logged in and created the tunnel in your playit.gg account.

You will need to create a tunnel in your Playit account pointing to port 25565.

If you followed the steps correctly and there were no problems, you should be able to enjoy your free and private Minecraft server, you can start and stop your server whenever you want using only the script without doing anything else.

The docker-compose file contains the configuration of how the container will be created to run for your server, if you want to run a specific version you must edit it and change the version you want by editing the line "VERSION: ".
