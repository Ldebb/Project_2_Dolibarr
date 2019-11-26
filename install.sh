#!/bin/bash

echo "clean terminal"
vagrant halt && clear

echo "start vagarant"
vagrant up && vagrant provision
#if (($?)); then
if [[ $? > 0 ]]; then
#    echo "vagrant ssh contol" && vagrant ssh contol
    vagrant ssh contol
fi
