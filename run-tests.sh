#!/bin/bash 

set -ex

default_pharo_version="stable"
default_packages_dir="mc"
default_tests="$baseline.*"

# add a default version ()
if [ -z "$pharo_version" ]; then
	pharo_version="$default_pharo_version"
fi

# add a default repository
if [ -z "$packages_dir" ]; then
	packages_dir="$default_packages_dir"
fi

# add a default tests
if [ -z "$tests" ]; then
	tests="$default_tests"
fi

# download pharo
wget --quiet -O - get.pharo.org/$pharo_version+vm | bash
# install project
./pharo Pharo.image eval --save "
Metacello new 
	baseline: '$baseline';
	repository: 'filetree://$packages_dir';
	load.
"
# execute tests
./pharo Pharo.image test --no-xterm --fail-on-failure "$tests" 2>&1
