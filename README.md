# ecs-stop-task

In development environments there's usually have only one ECS Task, and sometimes a developer might want to restart this ECS task. This script is useful for "restarting" ECS Tasks, assuming there's an ECS Service which makes sure the desired ECS Task number is one (1)

## Requirements

- IAM permissions - [iam_policy.json](./iam_policy.json)
- [jq](https://stedolan.github.io/jq/)

## Usage

### Docker

- With credentials file

  ```bash
  docker run --rm -it \
    -v ~/.aws:/root/.aws \
    unfor19/ecs-stop-task -c my-cluster -f my-task-family
  ```

- With environment variables

  ```bash
  docker run --rm -it \
    -e AWS_REGION \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
      unfor19/ecs-stop-task -c my-cluster -f my-task-family
  ```

_NOTE_: aws-vault users need to add

```bash
  -e AWS_SECURITY_TOKEN \
  -e AWS_SESSION_TOKEN \
```

### From Source

1. Clone this repo
1. Stop (restart) the task
   ```bash
   $ bash main.sh -c my-cluster -f my-task-family
   ```
