# ecs-stop-task

In development environments there's usually only one ECS Task, and sometimes a developer might want to restart this ECS task. This script is useful for restarting (stopping) ECS Tasks, assuming there's an ECS Service which makes sure the desired ECS Task number is one (1)

## Requirements

IAM permissions - [iam_policy.json](./iam_policy.json)
```json
  
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["ecs:ListTasks", "ecs:StopTask"],
      "Resource": [
        "arn:aws:ecs:${AWS_REGION}:${ACCOUNT_IT}:container-instance/*",
        "arn:aws:ecs:${AWS_REGION}:${ACCOUNT_IT}:task/*"
      ]
    }
  ]
}
```


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

1. Download and install [jq](https://stedolan.github.io/jq/)
1. Clone this repo
1. Stop (restart) the task
   ```bash
   $ bash main.sh -c my-cluster -f my-task-family
   ```
