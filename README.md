A simplified version to use [Pharo](http://pharo.org) and Travis CI
======

This is a simple script that will do what you want in a simple way (it simplifies the use of smalltalk-ci for those 
who do not need a multi-smalltalk matrix) :)


You will need to define a `.travis.yml` in your project:
```
language: c
os:
  - linux
  - osx
addons:
  apt:
    packages:
      - lib32asound2
      - lib32z1
      - lib32bz2-1.0
      - libssl1.0.0:i386
      - libfreetype6:i386
before_script: 
  - git clone --depth=1 https://github.com/estebanlm/pharo-travis-ci.git
script:
  - pharo-travis-ci/run-tests.sh
env: 
  global: 
    # MANDATORY. It will tell the script which baseline needs to load.
    - baseline="YourBaseline"
    # OPTIONAL. It indicates where to find baseline (default is "mc")
    - package_dir="mc"
    # OPTIONAL. Defines which tests to run (default is "YourBaseline.*")
    - tests="YourBaseline.*"
  matrix: 
    # OPTIONAL. It determines the pharo version, same as [zeroconf](http://get.pharo.org) (default is "stable")
    - pharo_version="stable"
    - pharo_version="alpha" 		
    - pharo_version="50"
    - pharo_version="40"
    - pharo_version="30"
```
