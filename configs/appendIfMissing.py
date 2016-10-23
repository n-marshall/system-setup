import re, os, subprocess, mmap, sys, urllib2, pprint
REPO_PATH = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

URL_REGEX = r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'
SOURCE_TYPE_URL = 'URL'
SOURCE_TYPE_FILE = 'file'
SOURCE_TYPE_STRING = 'string'
APPEND_COMMAND = 'zsh -c \'. {}/configs/shell-functions.sh && {} \"{}\" {}\''

def isSourceContentsInDestFile(sourcePath, destFileFullPath, sourceType):
    if sourceType == SOURCE_TYPE_URL:
        sourceContents = urllib2.urlopen(sourcePath).read()
    elif sourceType == SOURCE_TYPE_FILE:
        sourceContents = open(sourcePath).read()
    elif sourceType == SOURCE_TYPE_STRING:
        sourceContents = sourcePath

    print destFileFullPath
    if os.path.isfile(destFileFullPath) and os.stat(destFileFullPath).st_size != 0:
        with open(destFileFullPath) as destFile:
            destFileAccess = mmap.mmap(destFile.fileno(), 0, access=mmap.ACCESS_READ)
            if destFileAccess.find(sourceContents) != -1:
                return True
            else:
                return False
    else:
        return False
        print 'file is empty'


def append(source, destFileFullPath, sourceType):
    if sourceType == SOURCE_TYPE_URL:
        appendFunction = 'appendFromURL'
    elif sourceType == SOURCE_TYPE_FILE:
        appendFunction = 'appendFromFile'
    elif sourceType == SOURCE_TYPE_STRING:
        appendFunction = 'appendFromString'
    command = APPEND_COMMAND.format(REPO_PATH, appendFunction, source, destFileFullPath)
    os.system(command)


def appendIfMissing(source, dest):
    if re.match(URL_REGEX, source, flags=0):
        sourceType = SOURCE_TYPE_URL
    elif os.path.isfile(source):
        sourceType = SOURCE_TYPE_FILE
    else:
        sourceType = SOURCE_TYPE_STRING

    destFileFullPath = os.path.expanduser(dest)
    if os.path.isfile(destFileFullPath):
        if isSourceContentsInDestFile(source, destFileFullPath, sourceType):
            print ('Source\'s contents found in dest file, no need to append')
        else:
            print('Source\'s contents cannot be found in dest file, appending...')
            append(source, destFileFullPath, sourceType)

    else:
        print "destfile not a file yet, copying sourcefile to destfile..."
        append(source, destFileFullPath, sourceType)


if len(sys.argv) != 3:
    print 'arguments: '
    pprint.pprint(sys.argv)
    sys.exit('[ERROR] appendIfMissing.py, line 31: number of arguments passed is not 2')
else:
    appendIfMissing(sys.argv[1], sys.argv[2])
