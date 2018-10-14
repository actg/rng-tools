#!/bin/sh

if [ ! -r /dev/urandom ]
then
	echo "NO URANDOM DEVICE, SKIPPING TEST"
	exit 77
fi

# Confirm that /dev/urandom produces enough randomness to pass the FIPS-140-2
# randomness validation tests.  This isn't a great test, but it should work, and
# failure indicates some problems in /dev/urandom (or the test) anyway
cat /dev/urandom | ../rngtest -c 100 --pipe >/dev/null
if [ $? -ne 0 ]
then
	exit 1
fi

exit 0
