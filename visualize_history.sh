#!/bin/bash

git log --pretty=format:"%cn,%h,%cd" --shortstat --no-merges | ./gitlogparse.py
