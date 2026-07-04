#!/bin/bash
danger=80
usage="df / | awk 'NR==2 {print$5}' | sed 's/%//' "
if [ $usage -gt $danger ]
then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "WARNING!!! SPACE IN (/) HAS EXCEDED CRITICAL LEVELS!!!!"
  echo " currnet usage : $usage more than $danger"
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
