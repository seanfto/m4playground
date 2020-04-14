#!/bin/bash

#
# me:
# podman exec --interactive --tty --workdir ${HOME} m4container
#
# root (shouldn't be needed though):
# podman exec --interactive --tty --user 0 --workdir /root m4container
#

podman run --rm --interactive --tty --name m4container \
        --hostname=${HOSTNAME} \
        --userns=keep-id \
        --volume /etc/localtime:/etc/localtime:ro \
        --volume ${HOME}/.gitconfig:${HOME}/.gitconfig:ro,Z \
	--volume /opt/spalade/m4container:/opt/spalade/m4container:rw,Z,shared \
        --workdir /opt/spalade/m4container \
        localhost/m4container

