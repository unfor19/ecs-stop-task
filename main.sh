#!/usr/bin/env bash
source bargs.sh "$@"
set -e
set -o pipefail

task_arn=$(aws ecs list-tasks --max-items 1 --cluster ${cluster_name} --family ${family_name} | jq -r .taskArns[0] || true)
if [[ -n "$(echo "$task_arn" | grep "An error occurred")" ]] ; then
    echo "ERR 1 :: $task_arn"
    exit 1
elif [[ -n "$(echo "$task_arn" | grep "taskId length should be one of")" ]]; then
    echo "ERR 254 :: $task_arn"
    echo "No tasks to stop, exit successfully with 0"
    exit 0
fi

echo "Stopping task ..."
export AWS_PAGER=""
aws ecs stop-task --cluster "${cluster_name}" --task "${task_arn}" --reason ${reason}
