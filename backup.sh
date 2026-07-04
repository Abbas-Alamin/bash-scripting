#!/bin/bash
# make sure the user added two files
if [ $# -ne 2 ]
then
  echo "this script work with two directory, try again"
  exit 1
fi

#make sure the rsync installed
if ! command -v rsync >/dev/null 2>$1
then
  echo "please install rsync package and try again"
  exit 2
fi

#make date format DD/MM/YYYY
currentdate=$(date +%F)

command="-avb --backup-dir=$2/$currentdate --delete"
rsync $command $1 $2/current >> backup_$currentdate.log
