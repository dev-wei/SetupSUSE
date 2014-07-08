#!/usr/bin/env python
import os
import socket
import load
from blessings import Terminal

# allowed host names
lst_hosts = ["fraitcf1vd2382", "USNYCWS596931", "Michaels-Mac-mini.local"]

# Terminal
terminal = Terminal()

# Host
local_host = socket.gethostname()


def load_env(environment):
    """load("dev")
    :param environment:
    """
    print "Load {0} environment on box: {1}".format(environment, local_host)
    load.main(environment)

def unload_env():
    pass


def main(environment="dev", version="current"):
    """

    :param environment:
    :param version:
    """

    # export ENVY_ROOT_DIR
    os.environ["ENVY_ROOT_DIR"] = os.environ["HOME"] + "/scripts/profile/" + version

    if local_host not in lst_hosts:
        print terminal.red("ERROR !!!!!!! unknown box {0}".format(local_host))
    else:
        load_env(environment)

