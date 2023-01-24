#!/bin/sh

# Build Args from Inputs
echo $EXTRA_ARGS
ls
case $COMMAND in
'git')
    cmd_args="${PATH}"
    ;;

'github')
    cmd_args="--organization=${ORG}"
    if [ ! -z $TOKEN ]
    then
        cmd_args+= "--token ${TOKEN}"
    ;;

's3')
    cmd_args="s3://${PATH}"
    ;;
esac

if $FAIL
then
    base_cmd+="--fail "
fi 

if $JSON
then 
    base_cmd+="--json "
fi

CMD="${COMMAND} ${cmd_args} ${EXTRA_ARGS}"
trufflehog $CMD --json >> $GITHUB_OUTPUT