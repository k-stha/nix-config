#!/usr/bin/env python3

"""Automatically upgrade all python packages."""

import os
from datetime import datetime
from platform import system
from subprocess import call, run

from pkg_resources import working_set


def create_dir(directory):
    """Create specified directory if it does not exist."""
    if not os.path.isdir(directory):
        os.makedirs(directory)


PIP = "pip3"

HOME = os.path.expanduser("~")

if system() == "Windows":
    LOGDIR = HOME + "\\AppData\\Local\\pip_upgrade\\"
    create_dir(LOGDIR)
else:
    LOGDIR = HOME + "/.cache/pip_upgrade/"
    create_dir(LOGDIR)

LOGFILE = LOGDIR + str(datetime.now().strftime("%Y-%m-%dT%H_%M_%SZ")) + ".log"

# pylint: disable-next=not-an-iterable
packages = [package.project_name for package in working_set]

pkglist = run([PIP, "freeze", "--all"], capture_output=True, check=True).stdout

with open(LOGFILE, "a", encoding="utf-8") as log:
    log.write(pkglist.decode("utf-8"))
log.close()

call(PIP + " install --upgrade " + " ".join(packages), shell=True)
