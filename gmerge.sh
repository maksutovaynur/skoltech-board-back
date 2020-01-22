#!/bin/bash

git checkout master
git merge develop
git pull
git push
git checkout develop
