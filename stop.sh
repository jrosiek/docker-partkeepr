#!/bin/bash
# vim: sw=4: ts=4: et

HERE="$(dirname "$(readlink -f "$0")")"
source "$HERE/common.inc.sh"

docker compose down
