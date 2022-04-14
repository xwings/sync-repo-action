#!/bin/bash
set -ex

setup_env() {
    gitee_url="ssh://git@gitee.com"
    target_repo=$INPUT_TARGET_REPO

    if [[ "$INPUT_TARGET_REPO" == "gitee" ]]; then
        gh_repo_name=$(git remote -v | grep -Po "github.com/\K[^. ]*" | head -1)
        target_repo=${gitee_url}/${gh_repo_name}.git
    fi
}

setup_ssh() {
    # Here is a pitfall if using ~/.ssh instead of /root/.ssh
    mkdir /root/.ssh
    echo "$INPUT_SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
}

push_code() {
    git config --global --add safe.directory /github/workspace
    echo "/github/workspace"
    git remote add target "$target_repo"
    git push target "$GITHUB_REF:$GITHUB_REF" -f
}

main() {
    setup_env
    setup_ssh
    push_code
}

main
