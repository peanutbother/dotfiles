#!/usr/bin/env bash

CURRENT_DIR="$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")"
CHTSH="$CURRENT_DIR/cht.sh"
LIST="$CURRENT_DIR/list"
ITEM="$(cat $LIST | fzf --preview="bash $CHTSH {}")"

if [ "$ITEM" == "" ]; then
    exit 0
fi

read -e -p "Query for $ITEM: " QUERY

QUERY="$(printf $QUERY | sed 's/\ /+/g')"

bash $CHTSH $ITEM $QUERY | $PAGER
