 #! /bin/bash

echo "--- About to run license_finder. ---"
echo "Current Directory: " $PWD
gem install rake
gem install i18n
gem install license_finder
license_finder
echo "Running again with full bundle install: "
bundle install
license_finder
echo "Current Directory: " $PWD
echo "--- license_finder finished. ---"