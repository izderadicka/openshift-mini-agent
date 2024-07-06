#!/bin/bash

# This file contains just the variables shared 
# between the setup/cleanup scripts

assets_dir=/opt/mini-agent            # Temporary folder to store all the files required to perform the installation
network=mini-agent                    # This the name of the network that will be created 
hostname=agent-sno                    # The hostname of the SNO instance
rendezvousIP=192.168.133.80           # In case of SNO, this is also the host IP
rendezvousMAC=52:54:00:93:72:25       # In case of SNO, this is also the host MAC

baseDomain=${network}.org
domain=sno.${baseDomain}
apiDomain=api.${domain}

memory=16384
vcpus=8

pullSecret='{"auths": {"empty": {"auth": "ZW1wdHk6ZW1wdHkK"}}}'