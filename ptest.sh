#!/bin/bash
# PwnTest
# by Tobias Fried
# Check password security against HaveIBeenPwned.com public database of compromised passwords.
# Uses k-Anonymity to query passwords based on the first 5 characters of theri SHA-1 hash.

check() {
    PASSWORD=$(echo -n "$1" | sha1sum | sed -r 's/([A-Za-z0-9]+).*/\1/' | tr '[:lower:]' '[:upper:]')
    PREFIX=$(echo "$PASSWORD" | head -c 5)
    SUFFIX=$(echo "$PASSWORD" | tail -c +6)
    echo "Password: $1"
    echo "SHA1: $PASSWORD"
    QUERY=$(curl -s "https://api.pwnedpasswords.com/range/$PREFIX" | grep -i $SUFFIX)
    if [[ -n "$QUERY" ]]; then
	    QUERY=$(echo "$QUERY" | sed -r 's/.*:(.*)/\1/')
    else
        QUERY="0"
    fi
    echo "Compromised $QUERY times"
}

if [[ $# -lt 1 ]] ; then
    echo "Please enter password:"
    read -p "> " -s PASSWORD
    check "$PASSWORD"
else
    for PASSWORD in "$@"
    do
        check "$PASSWORD"
    done
fi
exit 0

