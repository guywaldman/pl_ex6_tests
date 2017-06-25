"""PL 234319 HW6 ex3 - test."""

import frog
import sys

# --------------------------------- constants ---------------------------------
RANGE = 100
TRIES_MAX = 100000


passed = True

try:
    for a in range(-RANGE, RANGE):
        if (a % 10 == 0):
            sys.stdout.write('.')
        sys.stdout.flush()
        gen = frog.frog()
        counter = 0
        try:
            counter = 0
            for x in gen:
                if (counter > TRIES_MAX):
                    passed = False
                    raise StopIteration(a)
                if (x == a):
                    raise StopIteration(a)
                counter += 1
        except StopIteration as e:
            if not passed:
                raise Exception(a)
            pass
except Exception as e:
    sys.stdout.write('\n')
    print "FAILED ( when trying to guess", e, ")."
if (passed):
    sys.stdout.write('\nPASSED')
sys.stdout.write('\n')
