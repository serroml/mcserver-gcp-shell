#!/usr/bin/zsh

script_name=$0


ayuda () {

        print "\n[!] Ayuda: $script_name [--start] [--stop] \n \n"

        exit 1

}



if (( $# != 1 )); then

        ayuda


fi


case $1 in


                "--start")


                        if [[ $(docker ps | grep minecraft | awk {'print $2'}) == "itzg/minecraft-server" ]]; then

                                print "\n[!] El servidor ya estaba activo, escribe $0 --stop para detenerlo \n \n"

                                exit 2


                        fi


                        print "\n[+] Comprobando que la carpeta minecraft-server existe... \n"


                        if [[ -d ~/minecraft-server/ ]]; then

                                print "\n[+] La carpeta minecraft-server existe \n"


                        else
                                print "\n[!] La carpeta no existe, creandola ahora \n"

                                mkdir minecraft-server


                        fi



                print "\n[+] Iniciando servidor... \n"

                docker compose up -d &>/dev/null

                print "\n[+] Servidor de Minecraft levantado \n"

                print "\n[+] Creando tunel... \n \n"

                ./playit


                        while (($? != 0)); do

                                print "\n[!] Fallo al crear el tunel, reintentando..."

                                sleep 2

                                ./playit
                        done

                ;;

                "--stop")


                        if [[ $(docker ps | grep minecraft | awk {'print $12'}) == "" ]]; then

                                print "\n[!] El servidor ya estaba detenido \n \n"

                                exit 3


                        fi


                print "\n[+] Deteniendo servidor... \n"

                docker stop $(docker ps) &>/dev/null

                docker system prune -f &>/dev/null

                exit 4

                ;;

esac


if [[ $1 != "--start" ]] || [[ $1 != "--stop" ]]; then

        ayuda


fi
