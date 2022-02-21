#!/usr/bin/env python3

"""Trace a python script's execution."""

import os
import sys
from subprocess import run

SCRIPT = os.path.basename(sys.argv[0])


def display_help():
    """Display help."""
    print(
        "Usage: "
        + SCRIPT
        + " [OPTION...] [FILE]\n\nOptions:\n"
        + "  -h, --help            Display this help and exit"
    )


ARG_LEN = len(sys.argv)

if ARG_LEN == 1:
    print("Please provide an argument or script name!\n")
    display_help()
    sys.exit(1)

elif ARG_LEN > 2:
    print("Please provide only one argument or script name!\n")
    display_help()
    sys.exit(1)

if sys.argv[1] in ("-h", "--help"):
    display_help()
    sys.exit()
else:
    pyfile = sys.argv[1]

PYTHON = "python3"

DIRS = os.pathsep.join(sys.path)
args = [PYTHON, "-m", "trace", "-m", "-g", "--ignore-dir", DIRS, "-t", pyfile]

run(args, check=True)
