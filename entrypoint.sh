#!/bin/bash
function cleanup()
{
    local pids=`jobs -p`
    if [[ "${pids}" != ""  ]]; then
        kill ${pids} >/dev/null 2>/dev/null
    fi
}

trap cleanup EXIT
if [[ "$1" == "bash" ]];then
    bash
else
    $(which python) manage.py runserver 0.0.0.0:8000 
fi
