# Tests for ex6 // PL 234319

## Don't Know GitHub?

Download this Repository and follow the instructions.

---

## Prolog

1. Copy `ex6.pl` inside the root directory of this Repo.
2. Run `test_rc.pl` with SWI-Prolog. In a BASH terminal: `swipl < test_rc.pl`

> **Note**: Some of the tests for `solve\4` are for 9x9 boards, so in case your tests hang for too long, consider removing some tests for `solve\4` (in the end of `test.pl`).


## Python (Dry ex3)

You don't have to, but if you wish to test your Python generator to solve the Frog Riddle:

1. Copy your Python script, named `frog.py` inside the `/python` directory in this Repo.
1. Make sure that your generator is named `frog()` solely for this test.
1. From the root directory, run: `python python/frog.test.py`.

> The test checks that you guess correctly, for all natural numbers in the range \[-100, 100\]. Please notice that after a particular amount of tries (100,000 as default), the test will fail. Depending on your algorithm, you may try adjusting the constants.

---

Good luck!
