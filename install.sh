#!/bin/bash


pwd ;

function test(){
    local status="$1";
    local name="$2";

    if [ "$status" == "0" ] ; then
        echo "";
        echo "  The process [$name] finish ok.";
        echo "";
    else
        echo "";
        echo "  The process [$name] FAILS.";
        echo "";
        exit 1;
    fi
}

# git remote set-url origin git@github.com:username/repo.git
# git config remote.origin.url https://vivalasvegas18:Fortuna18@github.com/vivalasvegas18/EP
# git remote -v 

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
echo -n
echo + GIT DONE.
