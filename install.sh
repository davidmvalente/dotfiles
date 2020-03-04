#! /bin/bash

# Install dotbot quietl
pip3 -q install dotbot
dotbot -c install.conf.yaml
exec bash
