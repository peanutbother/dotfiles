#!/bin/sh

CHEATSHEET_DIR=overlays/cht-sh/src/

curl -Ss https://cht.sh/:list > "$CHEATSHEET_DIR/list"
curl -Ss https://cht.sh/:cht.sh > "$CHEATSHEET_DIR/cht.sh"