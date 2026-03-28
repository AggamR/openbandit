file_path=/home/bandit8/data.txt

passwords_count=100

# start with the password, doesnt matter - will be shuffled
file_content="${passwords[9]}"
correct_line=$(( $RANDOM % $passwords_count ))  # choose line with word and password

# generate repeating random passwords
for i in $(seq 1 $passwords_count); do
  pass=$(generate_password)  # generate password-like
  file_content="$file_content\n$pass\n$pass"  # append duplicate password
done

echo -e "$file_content" | shuf > $file_path 
