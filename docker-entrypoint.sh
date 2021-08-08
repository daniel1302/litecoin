#!/bin/bash


echo "Running container as a $(whoami)";

CMD_BINARY="${1}";
# Execute docker command specified for litecoin
# Bash substring ref: https://reactgo.com/bash-get-first-character-of-string/
if [ "${CMD_BINARY::8}" == "litecoin" ]; then
    set -x;
    exec "$@" -datadir="/home/litecoin/.litecoind";
else
    set -x
    exec "$@";
fi;
