#!/bin/bash

#current path
cDir=`pwd` 

#git path
codeDir='/data/www/cafestory-server'

#update code
cd $codeDir 
git pull

cd ../ 
tar cvf cafe.tar.gz cafestory-server
mv cafe.tar.gz $cDir 
cd $cDir
eb deploy
#rm cafe.tar.gz
