#!/bin/bash
set -ev
if [ "$TRAVIS_BRANCH" = "master" ] ; then
  bundle exec pod spec lint
  bundle exec pod trunk push SwiftProgressiveTax.podspec
fi
