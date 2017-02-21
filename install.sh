#!/bin/bash

cwd=$(pwd)

# set up .profile
ln -s $cwd/profile $cwd/../.profile

# set up git
sh $cwd/git.sh


