#!/usr/bin/env python

import sys

def clear(token):
  return token.strip().replace(".", "").replace(",", "").lower()

for line in sys.stdin:
  keys = clear(line).split()

  for key in keys:
    print("%s\t%d" % (key, 1))
