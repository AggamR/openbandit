#!/bin/bash

# this script might be over-documented for such a short script
# but bash can look like magic sometimes (even though this is rather simple)
# so I rather just document it then have it mayve not understood

# generate passwords
passwords=()
for i in {1..34}; do
  # genearate 16-chars passwords from valid /dev/urandom cahracters
  passwords[$i]=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | head -c 16; echo)  
  adduser bandit${i} -s /bin/bash -D  # create users
  echo "bandit${i}:${passwords[$i]}" | chpasswd  # actually change passwords
done

# take ownership over all files
chown -R root:root /home
chmod -R 644 /home

# run all setups - source so that they could use `passwords[]`
for f in  /setups/*.sh; do
  source $f
done
