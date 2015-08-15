# Grab files online

import urllib2
import json
import os
from downloader import download
from threading import Thread

dlThreads = []
dlDir = os.path.realpath(os.path.expanduser("~/tempdownload"))
if not os.path.isdir(dlDir):
    os.makedirs(dlDir)

# Download github Atom editor latest
try:
    f = urllib2.urlopen("https://api.github.com/repos/atom/atom/releases/latest")
    data = json.load(f)
    for asset in data["assets"]:
        if asset["name"].lower() == "atom-amd64.deb":
            url = asset["browser_download_url"]
            th = Thread(target=download, args=[url, os.path.join(dlDir, "Atom.deb")])
            th.start()
            dlThreads.append(th)
except ValueError, urllib2.HTTPError:
    print "There was a problem resolving URL for ATOM editor."


if dlThreads:
    for th in dlThreads:
        th.join()
