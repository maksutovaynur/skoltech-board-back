#!/bin/bash

git checkout develop
git merge predevel
git pull
git push
git checkout predevel