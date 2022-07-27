#!/usr/bin/python3

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


def check_args():
    """Check the arguments provided."""
    arg_len = len(sys.argv)
    script_name = os.path.basename(sys.argv[0])
    display_help = return_help(script_name)

    if arg_len == 1:
        print("Please provide an argument or script name!\n", file=sys.stderr)
        print(display_help)
        sys.exit(1)

    elif sys.argv[1] in {"-h", "--help"}:
        print(display_help)
        sys.exit()


def run_trace(pyexec, dirs, pyfile):
    """Run the trace module."""
    args = [pyexec, "-m", "trace", "-m", "-g", "--ignore-dir", dirs, "-t"] + pyfile
    run(args, check=True)


def main(argv):
    """Start code execution."""
    check_args()

    python_executable = sys.executable
    dirs_to_exclude = os.pathsep.join(sys.path)

    run_trace(python_executable, dirs_to_exclude, argv)


if __name__ == "__main__":
    main(sys.argv[1:])
