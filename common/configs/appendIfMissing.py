import re, os, subprocess, mmap, sys, pprint

def isFile1InFile2(file1Path, file2Path):
    with open(file2Path) as file2:
        file2Access = mmap.mmap(file2.fileno(), 0, access=mmap.ACCESS_READ)
        file1Contents = open(file1Path).read()
        if file2Access.find(file1Contents) != -1:
            return True
        else:
            return False

def appendIfMissing(source, dest):
    destFullPath = os.path.expanduser(dest)
    if os.path.isfile(destFullPath):
        if isFile1InFile2(source, destFullPath):
            print ('Source\'s contents found in dest file, no need to append')
        else:
            print('Source\'s contents cannot be found in dest file, appending...')
            # append source file to destfile
            command = ' '.join(['source', './common/configs/.shell-functions', '&&', 'catAndAppend', source, destFullPath])
            os.system(command)

    else:
        print "destfile not a file yet, copying sourcefile to destfile..."
        # copy source file to destfile
        command = ' '.join(['source', './common/configs/.shell-functions', '&&', 'catAndAppend', source, destFullPath])
        print command
        os.system(command)

if len(sys.argv) != 3:
        sys.exit('[ERROR] number of arguments passed is not 3')
else:
    appendIfMissing(sys.argv[1], sys.argv[2])
