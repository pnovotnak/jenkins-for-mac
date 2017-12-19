# Jenkins on Docker for Mac

This is a minimal configuration to help you get Jenkins running inside the docker-for-mac
VM with support for building in sister containers.

# Running

    . macOS ----------------------------.   . docker-for-mac VM ----------------.
    |                                   |   |   . Jenkins container ----------. |
    |                                   |   |   |                             | |
    |  /var/run/docker.sock <-> tcp <---+---+---+--> tcp <-> /tmp/docker.sock | |
