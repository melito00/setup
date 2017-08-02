#!/bin/zsh
#
cwd=`pwd`
echo $cwd
for dir in `find . -type d -name .git -print | sed 's/.git$//' | egrep -v '\/\.'`
do
  cd $dir
  gstatus=$(git status -s)
  if [[ ! -z $gstatus ]]; then
    echo $dir
    echo $gstatus
    echo ""
  fi
  cd $cwd
done  
