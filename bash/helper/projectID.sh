#!/bin/bash

fqdn() {
    cat ~/.gl/config.yml | yq e '.fqdn' -
}

token() {
    cat ~/.gl/creds.yml | yq e '.token' -
}

repositoriesOnCertainPage() {
    curl -s -H "PRIVATE-TOKEN: $(token)" \
        "$(fqdn)/api/v4/projects?per_page=100&page=${1}" |
        jq -r '.[] | (.id|tostring) + " " + .name'
}

allRepositories() {
    i="1"

    while repositoriesOnCertainPage $i | grep "[0-9]"; do
        i=$(($i + 1))
    done
}

projectID() {
    allRepositories | grep "${1}" | awk '{ print $1 }' | head -n1
}
