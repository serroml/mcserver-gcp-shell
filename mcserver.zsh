#!/usr/bin/zsh

script_name=$0


script_help () {

        print "\n[!] Help: $script_name [--start] [--stop] \n \n"

        exit 1

}



if (( $# != 1 )); then

        script_help


fi


case $1 in

                "--start")

                        if [[ $(docker ps | grep -w itzg/minecraft-server | awk {'print $12'}) == "itzg/minecraft-server" ]]; then

                                print "\n[!] The server was already active \n \n"

                                exit 2


                        fi


                        print "\n[+] Checking that the minecraft-server folder exists... \n"

                        if [[ -d ~/minecraft-server/ ]]; then

                                print "\n[+] The minecraft-server folder exists \n"

                        else
                                print "\n[!] The minecraft-server folder does not exist, creating it now \n"

                                mkdir minecraft-server


                        fi


                        print "\n[+] Starting server... \n"

                        docker compose up -d &>/dev/null

                        print "\n[+] Minecraft server up \n"

                        print "\n[+] Creating tunnel... \n \n"

                        sleep 2

                        ./playit-0.9.3


                        while (( $? != 0 )); do

                                print "\n[!] Failed to create the tunnel, retrying..."

                                sleep 2

                                ./playit-0.9.3

                        done

                ;;


                "--stop")

                        if [[ $(docker ps | grep -w itzg/minecraft-server | awk {'print $12'}) == "" ]]; then

                                print "\n[!] The server was already stopped \n \n"

                                exit 3


                        fi


                        print "\n[+] Stopping server... \n"

                        docker stop $(docker ps | grep -w itzg/minecraft-server | awk {'print $1'}) &>/dev/null

                        docker system prune -f &>/dev/null

                        exit 4

                ;;


                *)
                        script_help

                ;;

esac
