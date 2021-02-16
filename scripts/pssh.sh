#!/bin/bash
# An utility to store securely ssh passwords and retrieve them automagically.
# It relies on pass (UNIX password manager) having SSH passwords saved under ssh/ path.
# For example: pssh root@remote will lookup pass ssh/root@remote and use sshpass to provide it.
#
# The first argument is used for the lookup and the connection, the rest of them are passed directly to ssh. 
sshAlias=$1
# Retrieve the password from pass encrypted data store
sshPassword=$(/usr/bin/pass ssh/$sshAlias)
# take out the first element of the arguments so $@ contains only the rest
shift
# launch ssh with sshpass
/usr/bin/sshpass -p $sshPassword ssh $sshAlias $@
