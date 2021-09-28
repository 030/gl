#!/bin/bash

. ./bash/helper/projectID.sh

protectedBranches() {
    curl --request POST \
        --header "PRIVATE-TOKEN: $(token)" \
        "$(fqdn)/api/v4/projects/${1}/protected_branches?name=${2}&push_access_level=30&merge_access_level=30&unprotect_access_level=40"
    echo
}

main() {
    id=$(projectID "\s${1}$")
    echo $id
    protectedBranches $id "${2}"
}

main $1 $2
