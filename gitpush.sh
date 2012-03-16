#! /bin/bash

echo -n "What would you like the commit to say?"
read -e COMMIT
git add .
git commit -m COMMIT
git push
