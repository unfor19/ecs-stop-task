# ecs-stop-task

In development environments there's usually have only one ECS Task, and sometimes a developer might want to restart this ECS task. This script is useful for "restarting" ECS Tasks, assuming there's an ECS Service which makes sure the desired ECS Task number is one (1)

## Requirements

- IAM permissions - [iam_policy.json](./iam_policy.json)
- [jq](https://stedolan.github.io/jq/)

## Usage

1. Clone this repo
1. Stop (restart) the task
   ```bash
   $ bash main.sh -c my-cluster -f my-task-family
   ```
