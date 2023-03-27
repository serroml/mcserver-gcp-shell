# mcserver-gcp-shell
ZSH script for deploying a Minecraft server on Google Cloud Shell for free

Requirements:

- A gmail account
- A playit.gg account


1. Go to your Google Cloud Console

https://console.cloud.google.com


2. Open the web terminal (at the top right)


Edit your .bashrc with the following code at the end:

# Check if ZSH is installed

check_zsh () {

 if [[ -f $(which zsh) ]]; then

        return 0
        
else

        return 1

fi

}


check_zsh


if (( $? != 0 )); then

        sudo apt update &>/dev/null
        sudo apt install zsh -y &>/dev/null


fi



3. With this change every time you start the server it will take a few seconds until you can type in your web terminal


4.
