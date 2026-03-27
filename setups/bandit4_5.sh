mkdir /home/bandit4/inhere

for i in {1..9}; do
    echo $(generate_password) > "/home/bandit4/inhere/-file0$i"
done

echo "${passwords[5]}" > "/home/bandit4/inhere/-file07"
