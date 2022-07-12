#!/bin/bash

EXPECTED="0"
DELAY="0"
REPEAT="-1"
COUNTER="0"
SUCCESS=""
FAILURE=""

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -c|--command)
      COMMAND="$2"
      shift
      shift
      ;;
    -e|--expected)
      EXPECTED="$2"
      shift
      shift
      ;;
    -f|--failure)
      FAILURE="$2"
      shift
      shift
      ;;
    -s|--success)
      SUCCESS="$2"
      shift
      shift
      ;;
    -d|--delay)
      DELAY="$2"
      shift
      shift
      ;;
    -r|--repeat)
      REPEAT="$2"
      shift
      shift
      ;;
  esac
done

while true
do
  $COMMAND
  STATUS=$?
  if [ $STATUS -eq $EXPECTED ]
  then
    $SUCCESS
    exit $STATUS
  else
    $FAILURE
    COUNTER=$((COUNTER+1))
    if [ $COUNTER -eq $REPEAT ]
    then
      exit $STATUS
    fi
    sleep $DELAY
  fi
done
