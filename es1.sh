#!/bin/bash

cd $HOME/Desktop
rm -rf multiConf
git init multiConf
cd multiConf

for i in {1..13}; do
echo "Header file $i" > file$i.txt
git add file$i.txt
git commit -m "C$i main"

if [ $(($i % 2)) -ne 0 ]; then
git branch "F$i"
fi 
done

git checkout F5

for i in {1..3}; do
echo "Modifica su file$i" >> file$i.txt
git add file$i.txt
git commit -m "Working on file$i.txt in F5"
if [ $i -eq 2 ]; then
git branch hotfixF5
fi
done

git checkout hotfixF5

for i in {1..4}; do

echo "Dati$i" >> file$i.txt
git add file$i.txt
git commit -m "HFC$i: some mods in hotfixF5"

for j in {2..3}; do

echo "Dati$i$j" >> file$i.txt
git add file$i.txt
git commit -m "HFC$i$j: some mods in hotfixF5"

done
done

git checkout F5
git merge hotfixF5

nano file3.txt
git add file3.txt
git commit -m "Merge hotfixF5 -> F5"
git branch -d hotfixF5

git checkout master
git merge F5 -m "Merge F5 -> master"
git branch -d F5

git log --oneline --graph --all
