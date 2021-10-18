#!/bin/bash

. ./bash/helper/projectID.sh

mergeRequest() {
    curl --request POST \
        --header "PRIVATE-TOKEN: $(token)" \
        --header "Content-Type: application/json" \
        "$(fqdn)/api/v4/projects/${1}/merge_requests" \
        --data "{\"source_branch\": \"${2}\",\"target_branch\": \"${3}\",\"title\":\"[${4}] $5\",\"assignee_id\": $6}"
}

main() {
    id=$(projectID "\s${1}$")
    mergeRequest $id "${2}" "${3}" "${4}" "${5}" "${6}"
}

main $1 $2 $3 $4 $5 $6
