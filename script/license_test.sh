 #! /bin/bash

echo "--- About to run license_finder. ---"
echo "Current Directory: " $PWD
license_finder
echo "Current is now: " $PWD
cd ..
license_finder
echo "--- license_finder finished. ---"