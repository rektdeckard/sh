#!/bin/bash
pushd .
for repo in \
/opt/Discline \
/opt/midnight-commander \
/opt/purple-discord \
~/tg
do
    (cd "${repo}" && git checkout master && git up)
done
popd
exit 0
