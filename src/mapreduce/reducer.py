#!/usr/bin/env python

import sys

prev_key = None
aggregated_value = 0

for line in sys.stdin:
  key, value = line.strip().split("\t", 1)
  value = int(value)

  if prev_key == key:
    aggregated_value += 1
    continue

  if prev_key:
    print("%s\t%d" % (prev_key, aggregated_value))

  aggregated_value = value
  prev_key = key

print("%s\t%d" % (prev_key, aggregated_value))
