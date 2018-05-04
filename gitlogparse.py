#!/usr/bin/env python

import sys
import csv
import re
from pprint import pprint
from email.utils import parsedate
import matplotlib.pyplot as plt
from matplotlib.dates import date2num
import datetime


def parseCommit(std_in):
    # dict to store commit data
    commit = {}
    # array to store dict of commit data
    commits = []
    # iterate lines and save
    commitLines = csv.reader(std_in, skipinitialspace=True)
    for nextLine in commitLines:
        if len(nextLine) == 0:
            continue
        elif nextLine[0][0].isalpha():
            commit['commiter'] = nextLine[0]
            commit['hash'] = nextLine[1]
            commit['time'] = parsedate(nextLine[2])
        elif nextLine[0][0].isdigit():
            nums = reduce(list.__add__, [re.findall(r'\d+\b', s) for s in nextLine])
            commit['file'] = int(nums[0])
            commit['add'] = int(nums[1])
            if len(nums) > 2:
                commit['delete'] = int(nums[2])
            commits.append(commit)
            commit = {}
    return commits


def merge_date(commits):
    cur = {}
    file = []
    add = []
    delete = []
    date = []
    cur['file'] = commits[0]['file']
    cur['add'] = commits[0]['add']
    if 'delete' in commits[0]:
        cur['delete'] = commits[0]['delete']
    else:
        cur['delete'] = 0
    cur['time'] = commits[0]['time']
    for commit in commits[1:]:
        if cur['time'][0] == commit['time'][0] and cur['time'][1] == commit['time'][1] \
            and cur['time'][2] == commit['time'][2]:
            cur['file'] += commit['file']
            cur['add'] += commit['add']
            if 'delete' in commit:
                if 'delete' not in cur:
                    cur['delete'] = 0
                cur['delete'] += commit['delete']
        else:
            file.append(cur['file'])
            add.append(cur['add'])
            delete.append(cur['delete'])
            date.append(datetime.datetime(cur['time'][0], cur['time'][1], cur['time'][2], 0, 0))
            cur['file'] = commit['file']
            cur['add'] = commit['add']
            if 'delete' in commit:
                cur['delete'] = commit['delete']
            else:
                cur['delete'] = 0
            cur['time'] = commit['time']
    file.append(cur['file'])
    add.append(cur['add'])
    delete.append(cur['delete'])
    date.append(datetime.datetime(cur['time'][0], cur['time'][1], cur['time'][2], 0, 0))
    return (date, file, add, delete)



if __name__ == '__main__':
    commits = parseCommit(sys.stdin)
    (date, file, add, delete) = merge_date(commits)
    date = date2num(date)
    
    fig = plt.figure()
    
    ax = plt.subplot(311)
    ax.bar(date, file, color='b', align='center', label='# of files changed')
    ax.xaxis_date()
    ax.legend()
    plt.gcf().autofmt_xdate()
    
    ax = plt.subplot(312)
    ax.bar(date, add, color='g', align='center', label='# of lines added')
    ax.xaxis_date()
    ax.legend()
    plt.gcf().autofmt_xdate()
    
    ax = plt.subplot(313)
    ax.bar(date, delete, color='r', align='center', label='# of lines deleted')
    ax.xaxis_date()
    ax.legend()
    plt.gcf().autofmt_xdate()
    
    plt.savefig('git-hist.png')

