#!/bin/bash
source bargs.sh "$@"

task_arn=$(aws ecs list-tasks --max-items 1 --cluster ${cluster_name} --family ${family_name} | jq -r .taskArns[0])
aws ecs stop-task --cluster "${cluster_name}" --task "${task_arn}" --reason ${reason}
