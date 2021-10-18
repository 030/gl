#!/bin/bash

. ./bash/helper/projectID.sh

defaultBranch() {
    curl --request PUT \
        --header "PRIVATE-TOKEN: $(token)" \
        "$(fqdn)/api/v4/projects/${1}" \
        --data "default_branch=${2}"
    echo
}

main() {
    id=$(projectID "\s${1}$")
    echo $id
    defaultBranch $id "${2}"
}

main $1 $2
