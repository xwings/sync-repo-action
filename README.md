![test](https://github.com/acefei/sync-repo-action/workflows/test/badge.svg)

# Sync github repo to gitee action

This action will sync github repo to gitee on the fly when you push the github repo which you want to sync.

## Inputs

### `ssh_private_key`

**Required** The user's ssh private key for gitee.

### `target_repo`

**Required** The remote url of gitee, or just use `gitee` if the repo name is identical with github.

## Example usage
```
name: sync to gitee
on:
  push:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
    - uses: acefei/sync-repo-action@master
      with:
        ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
        target_repo: gitee
```

## Reference 
[Creating a Docker container action](https://help.github.com/en/actions/building-actions/creating-a-docker-container-action#write-the-action-code)
