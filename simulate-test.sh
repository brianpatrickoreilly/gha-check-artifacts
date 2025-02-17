#!/usr/bin/env bash

# This script is used to simulate the automation tests
# it will generate a fake report file in the `output` directory with the current timestamp and some random data
# it will then randomly decide if the tests passed or failed and write a message with appropriate emojis and text to the file output_body.md in markdown format. This file will be used as the markdown body of a github release

# create the output directory if it doesn't exist
mkdir -p output

# generate a fake report file with the current timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
report_file="output/report_${timestamp}.txt"
echo "This is a fake report file generated at ${timestamp}" > $report_file

# generate a fake report body with emojis and text
body_file="output_body.md"
echo "# Test Report ${timestamp}" > $body_file
echo "" >> $body_file
echo "## Summary" >> $body_file
echo "" >> $body_file
# randomly decide if the tests passed or failed
if [ $((RANDOM % 2)) -eq 0 ]; then
  echo ":white_check_mark: All tests passed!" >> $body_file
else
  echo ":x: Some tests failed!" >> $body_file
fi

# add some random text to the body
echo "" >> $body_file
echo "Here is some random text to fill the body of the report. This could be more detailed information about the tests that were run, the environment they were run in, or any other relevant information." >> $body_file
