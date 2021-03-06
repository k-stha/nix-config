#!/usr/bin/env python3

"""Automatically upgrade all python packages."""

import os
from datetime import datetime
from platform import system
from subprocess import run

from pkg_resources import working_set


def create_dir(directory):
    """Create specified directory if it does not exist."""
    if not os.path.isdir(directory):
        os.makedirs(directory)


PIP = "pip3"

HOME = os.path.expanduser("~")

if system() == "Windows":
    LOGDIR = HOME + "\\AppData\\Local\\pipup\\"
    create_dir(LOGDIR)
else:
    LOGDIR = HOME + "/.cache/pipup/"
    create_dir(LOGDIR)

LOGFILE = LOGDIR + str(datetime.now().strftime("%Y-%m-%dT%H_%M_%SZ")) + ".txt"

pkglist = run([PIP, "freeze", "--all"], capture_output=True, check=True).stdout

with open(LOGFILE, "w", encoding="utf-8") as log:
    log.write(pkglist.decode("utf-8"))

# pylint: disable-next=not-an-iterable
args = [PIP, "install", "--upgrade"] + [pkg.project_name for pkg in working_set]

run(args, check=True)
