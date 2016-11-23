#!/bin/bash

pwd ;

function test(){
    local status="$1";
    local name="$2";

    if [ "$2" == "0" ] ; then
        echo "";
        echo "  The process [$1] finish ok.";
        echo "";
    else
        echo "";
        echo "  The process [$1] FAILS.";
        echo "";
        exit 1;
    fi
}

echo "+"
echo "+ Cleaning ...."
find . -name \*~ -print -exec rm -rf {} \;


echo + Git add
git add --all .
test  "$?" "Git add";


echo + Git commit
git commit -a --allow-empty -m "" --allow-empty-message
test "$?" "Git commit";

echo + Git push origin
git push origin master
test "$?" "Git push origin";

echo + Git fetch origin
git fetch origin
test "$?" "Git fetch origin";

echo + Git merge origin/master
git merge origin/master
test "$?" "Git merge origin";

echo -n
echo + GIT DONE.
