#!/bin/bash

cd $HOME/Desktop
rm -rf smc
git init smc
cd smc

for i in {1..10}; do
echo "Intestazione file $i" > file$i.txt
git add file$i.txt
git commit -m "C$i: aggiunta file$i.txt"
done

for i in {1..10}; do
echo "frase1" >> file$i.txt
echo "frase2" >> file$i.txt
echo "frase3" >> file$i.txt

if [ $(( $i % 2 )) -eq 1 ]; then
git add file$i.txt
git commit -m "Added mods on odd files"
fi
done

git status
git log --oneline --graph

git rm --cached file6.txt file8.txt
git status

git commit -m "Rimozione file6.txt e file8.txt dal repository"

mkdir Saves
git mv file2.txt Saves
git mv file4.txt Saves
git mv file10.txt Saves
git status

git add Saves/file2.txt Saves/file4.txt Saves/file10.txt
git status

git commit -m "Moved some files in Saves"
git status

git branch FS
git branch FN
git branch HF

git checkout FS
echo "Intestazione file FS" > fileFS.md
echo "riga di testo" >> file1.txt
echo "riga di testo" >> file3.txt
git add file6.txt fileFS.md file1.txt file3.txt
git commit -m "Work on FS"

git log --oneline --all --graph

git checkout FN
rm file8.txt
git rm file9.txt
echo "riga di testo" >> file1.txt
echo "riga di testo" >> file3.txt
git status
git add file1.txt file3.txt
git commit -m "Removed some things"

git log --oneline --all --graph

git checkout main
git merge FS -m "Merge FS -> main"
git branch -d FS

git merge FN -m "Merge FN -> main"
git branch -d FN

git log --oneline --all --graph
