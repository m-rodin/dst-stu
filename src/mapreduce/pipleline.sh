#!/usr/bin/env bash

BASE_DIR="."
DATA_DIR="$BASE_DIR/d/mr/tf-idf/"
MR_CODE_DIR="$BASE_DIR/src/mapreduce/"

cat $DATA_DIR/* | $MR_CODE_DIR/mapper.py | sort | $MR_CODE_DIR/reducer.py > output.tsv

