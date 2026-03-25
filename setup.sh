# generate passwords
passwords=()
for i in {1..34}; do
  passwords[$i]=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | head -c 16; echo)
  adduser bandit${i} -s /bin/bash -D
  echo "bandit${i}:${passwords[$i]}" | chpasswd
done

# run all setups
for f in  /setups/*.sh; do
  source $f
done
