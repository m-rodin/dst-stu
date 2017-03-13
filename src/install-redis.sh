#!/usr/bin/env bash

cDir="$PWD"

v='3.2.8'
f="redis-$v.tar.gz"

cd ~

curl -L -O "http://download.redis.io/releases/$f"
tar -xf "$f"
unlink "./$f"

cd "$cDir"

