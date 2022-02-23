#!/usr/bin/env python3

"""Trace a python script's execution."""

import os
import sys
from subprocess import run


def return_help(script_name):
    """Return help text."""
    return (
        "Usage: "
        + script_name
        + " [OPTION...] [FILE]\n\nOptions:\n"
        + "  -h, --help            Display this help and exit"
    )


ARG_LEN = len(sys.argv)
SCRIPT_NAME = os.path.basename(sys.argv[0])
display_help = return_help(SCRIPT_NAME)

if ARG_LEN == 1:
    print("Please provide an argument or script name!\n", file=sys.stderr)
    print(display_help)
    sys.exit(1)

elif sys.argv[1] in {"-h", "--help"}:
    print(display_help)
    sys.exit()

else:
    pyfile = sys.argv[1:]

PYTHON = sys.executable

DIRS = os.pathsep.join(sys.path)
args = [PYTHON, "-m", "trace", "-m", "-g", "--ignore-dir", DIRS, "-t"] + pyfile

run(args, check=True)
