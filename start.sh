#!/bin/bash
# vim: sw=4: ts=4: et

HERE="$(dirname "$(readlink -f "$0")")"
source "$HERE/common.inc.sh"

mkdir -p "$PARTKEEPR_ROOT/db"
mkdir -p "$PARTKEEPR_ROOT/conf"
mkdir -p "$PARTKEEPR_ROOT/data"
mkdir -p "$PARTKEEPR_ROOT/web"


docker compose up -d
