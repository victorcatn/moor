#!/usr/bin/env bash

EXIT_CODE=0

cd moor
echo $(pwd)
dart format -o none --set-exit-if-changed . || EXIT_CODE=$?
dart analyze --fatal-infos --fatal-warnings || EXIT_CODE=$?
cd ..

# todo we don't analyze this subproject because Flutter isn't installed in the CI
#cd moor_flutter
#echo $(pwd)
#dartfmt -n --set-exit-if-changed . || EXIT_CODE=$?
#dartanalyzer --options analysis_options.yaml --fatal-infos --fatal-warnings lib/ || EXIT_CODE=$?
#cd ..

#cd moor_ffi
#echo $(pwd)
#dartfmt -n --set-exit-if-changed . || EXIT_CODE=$?
#dartanalyzer --options analysis_options.yaml --fatal-infos --fatal-warnings lib/ test/ || EXIT_CODE=$?
#cd ..

cd moor_generator
echo $(pwd)
dart format -o none --set-exit-if-changed . || EXIT_CODE=$?
dart analyze --fatal-infos --fatal-warnings || EXIT_CODE=$?
cd ..

cd sqlparser
echo $(pwd)
dart format -o none --set-exit-if-changed . || EXIT_CODE=$?
dart analyze --fatal-infos --fatal-warnings || EXIT_CODE=$?

exit $EXIT_CODE