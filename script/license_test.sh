 #! /bin/bash

echo "--- About to run license_finder. ---"
echo "Current Directory: " $PWD
cd ..
license_finder
echo "--- license_finder finished. ---"