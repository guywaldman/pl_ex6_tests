"""PL 234319 HW6 ex3 - test."""

import frog
import sys

RANGE_A = (-50, 50)
RANGE_B = (-5, 5)
MAX_GUESSES = 10e4

passed = True
passes = 0

print "Running test, please wait..."

try:
        for a in range(RANGE_A[0], RANGE_A[1]):
                for b in range(RANGE_B[0], RANGE_B[1]):
                        sys.stdout.flush()
                        gen = frog.frog()
                        try:
                                counter = 0
                                for guessed in gen:
                                        if (guessed == a + b * counter):
                                            passes += 1
                                            raise StopIteration(a)
                                        elif (counter > MAX_GUESSES):
                                            passed = False
                                            raise StopIteration(a)
                                        counter += 1
                        except StopIteration as e:
                                if not passed:
                                        raise Exception(a)
                                pass
except Exception as e:
        print "FAILED ( when trying to guess", e, ").\n"
if (passed):
        sys.stdout.write('PASSED\n')
