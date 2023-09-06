#!/usr/bin/env bash

./dub/scripts/man/gen_man.d
rm -rf docs/cli-reference/
mkdir docs/cli-reference/
cp dub/scripts/man/*.md docs/cli-reference/
