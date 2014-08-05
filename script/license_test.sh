 #! /bin/bash

echo "--- About to run license_finder. ---"
echo "Current Directory: " $PWD
gem install license_finder
license_finder
echo "Current Directory: " $PWD
echo "--- license_finder finished. ---"