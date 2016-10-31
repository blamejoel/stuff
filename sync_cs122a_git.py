#!/usr/bin/env python3
import shutil
import os
import sys
import re
import pprint

netId = 'jgome043'
atmelDir = '/home/joel/atmel-studio/'
gitDir = '/home/joel/cs122a/git/'

def search_dir(path, pattern):
    result = []
    items = os.listdir(path)
    for item in items:
        mo = pattern.search(item)
        if mo:
            if not result or result[-1] != mo.group():
                result.append(mo.group())
    return result

def copy_missing(missing):
    missingLabs = []
    for newLab in missing:
        # prep regex pattern for netId_labx_party
        missingLabStr = re.compile(newLab + r'_part\d')
        # get all netId_labx_party
        missingLabs = search_dir(atmelDir,missingLabStr)
        # create netId_labx git directory
        os.makedirs(gitDir + newLab)
        # copy each netId_labx_party.c file
        for missingLab in missingLabs:
            srcFile = atmelDir + os.path.join(missingLab,missingLab,
                    missingLab + '.c')
            dest = gitDir + os.path.join(newLab,missingLab + '.c')
            shutil.copyfile(srcFile,dest)
            print('Source: ' + srcFile)
            print('Copy: ' + dest)

    return

def main():
    labStr = re.compile(netId + r'_lab\d')
    atmelContents = search_dir(atmelDir,labStr)
    gitDirContents = search_dir(gitDir,labStr)
    missingLabs = []

    # Look for items in atmel dir that are not in git dir
    for x in atmelContents:
        if x not in gitDirContents:
            missingLabs.append(x)

    if missingLabs:
        copy_missing(missingLabs)
    else:
        print('Everything up to date!')
    # print("Atmel Contents:")
    # pprint.pprint(atmelContents)
    # print("Git Dir Contents:")
    # pprint.pprint(gitDirContents)
    # print("Git dir is missing:")
    # pprint.pprint(missingLabs)
    return

if __name__ == "__main__":
    main()
