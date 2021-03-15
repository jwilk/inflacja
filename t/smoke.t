#!/usr/bin/env bash

# Copyright © 2020 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

set -e -u
pdir="${0%/*}/.."
prog="$pdir/inflacja"
echo 1..1
xout='398.38 PLN'
out=$("$prog" 4237 PLZ --from=1984 --to=2012)
say() { printf "%s\n" "$@"; }
diff=$(diff -u <(say "$xout") <(say "$out")) || true
if [ -z "$diff" ]
then
    echo 'ok 1'
else
    sed -e 's/^/# /' <<< "$diff"
    echo 'not ok 1'
fi

# vim:ts=4 sts=4 sw=4 et ft=sh
