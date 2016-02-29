A simplified version to use Pharo and Travis
======

This is a simple script that will do what you want in a simple :)


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
  - run-tests.sh
env:
  # MANDATORY. It will tell the script which baseline needs to load. 
  - baseline="YourBaseline"
  # OPTIONAL. It determines the pharo version. Values can be: "50", "40", "30", "stable", "latest" (defaults to "stable")
  - pharo_version="50" 		
  # OPTIONAL. It indicates where to find baseline (default is "mc")
  - package_dir="mc"
  # OPTIONAL. Defines which tests to run (default is "YourBaseline.*")
  - tests="YourBaseline.*"
```