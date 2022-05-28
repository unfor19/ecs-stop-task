#!/usr/bin/env bash
source bargs.sh "$@"
set -e
set -o pipefail

task_arn=$(aws ecs list-tasks --max-items 1 --cluster ${cluster_name} --family ${family_name} | jq -r .taskArns[0] || true)
if [[ -n "$(echo "$task_arn" | grep "An error occurred") ]]" ; then
    echo "$task_arn"
    exit 1
fi
aws ecs stop-task --cluster "${cluster_name}" --task "${task_arn}" --reason ${reason}
