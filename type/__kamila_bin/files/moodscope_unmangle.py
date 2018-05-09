#!/usr/bin/env python3

import sys
import re

def clean_nl(s):
    return re.sub(r'[\r\n]', '', s)

header_raw, *contents_raw = sys.stdin.readlines()
header = clean_nl(header_raw).split(',')
contents = [ clean_nl(s) for s in contents_raw ]
nfields = len(header)
oneline = r'\n'.join(contents)
split = oneline.split(',')
lines = [ split[i:i+nfields] for i in range(0, len(split), nfields) ]
for s in [header]+lines:
    sys.stdout.write(','.join(s)+'\n')
