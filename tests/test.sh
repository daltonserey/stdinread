#!/bin/env bash
function fail {
    echo "oops! failed in test"
    exit 1;
}

function success {
    echo "good! test succeeded"
    exit 0;
}

cd tests
npm i stdinread
[[ "$?" == "0" ]] || fail
cat cat.mjs | node cat.mjs > /tmp/copy-cat.mjs
[[ "$?" == "0" ]] || fail
diff cat.mjs /tmp/copy-cat.mjs
[[ "$?" == "0" ]] && success || fail
