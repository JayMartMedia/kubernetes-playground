#!/bin/bash
# kubectl apply -f deployment.yaml -f service.yaml

# start http://localhost:1337

#!/bin/bash
# Examples of how to use:
# ./start.sh -h
# ./start.sh -o


### Functions which will do the things ###
# Function to log usage message
# https://en.wikipedia.org/wiki/Usage_message
usage() {
    echo ""
    echo "Usage: ./start.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h                see usage instructions"
    echo "  -o                open in browser"
}

### Prep flags to determine what will happen ###
hflag=false
oflag=false

### Read input options and set flags ###
# https://www.mkssoftware.com/docs/man1/getopts.1.asp
# https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script
while getopts ho flag
do
    case "${flag}" in
        h) hflag=true;;
        o) oflag=true;;
    esac
done

### Perform actions based on flags ###
# Print the usage output and exit
if $hflag; then
    usage
    # exit early if calling help
    exit
fi

### Start script logic
kubectl apply -f deployment.yaml -f service.yaml

if $oflag; then
    start http://localhost:1337
fi
