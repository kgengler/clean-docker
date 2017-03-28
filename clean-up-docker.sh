#!/bin/bash
###############################################################################
#
# Removes old containers, and deletes the <none> images from docker
#
###############################################################################

green=`tput setaf 2`
red=`tput setaf 1`
reset=`tput sgr0`

containers_to_remove=($(docker ps -a -q --filter 'status=exited' | xargs))

if [ "0" -eq "${#containers_to_remove[@]}" ]; then
    echo "[${green}OK${reset}] No containers to remove"
else
    for container in "${containers_to_remove[@]}"; do
        cmd_err=$(docker rm "${container}" 2>&1)

        if [ "0" -eq "$?" ]; then
            echo "[${green}OK${reset}] Remove container ${container}"
        else
            echo "[${red}ERROR${reset}] Remove container ${container} - ${cmd_err}"
        fi
    done
fi

images_to_remove=($(docker images | grep "^<none>" | awk '{print $3}' | xargs))

if [ "0" -eq "${#images_to_remove[@]}" ]; then
    echo "[${green}OK${reset}] No images to remove"
else
    for image in "${images_to_remove[@]}"; do
        cmd_err=$(docker rmi "${image}" 2>&1)

        if [ "0" -eq "$?" ]; then
            echo "[${green}OK${reset}] Remove image ${image}"
        else
            echo "[${red}ERROR${reset}] Remove image ${image} - ${cmd_err}"
        fi
    done
fi

