# download files

from urllib import urlretrieve, ContentTooShortError
from os.path import isfile, basename
from shutil import move

def download(url, path):
    if not isfile(path):
        try:
            filename, headers = urlretrieve(url)
            move(filename, path)
        except (ContentTooShortError, IOError):
            print("There was an error downloading %s." % basename(path))
