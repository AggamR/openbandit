mkdir /home/bandit4/inhere

for i in {1..9}; do
    (< /dev/urandom | head -c 16; echo) > "/home/bandit4/inhere/-file0$i"
done

echo "${passwords[5]}" > "/home/bandit4/inhere/-file07"

