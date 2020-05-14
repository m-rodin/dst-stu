#!/bin/bash

cat ../../d/friends.json | jq '.friends[] | [.id, .name, .knows[]] | join(" ")' | tr -d '"' | xargs -n4 sh -c 'printf "$0;$1;$2\n$0;$1;$3\n"' | awk -f to-tree.awk | dot -Tjpg > friends.jpeg 
