#! /bin/bash

sh clean.sh
echo -n "What would you like the commit to say?  "
read COMMIT
git add .
git commit -m $COMMIT
git push
read -n 1 -p "Press any key to continue"
