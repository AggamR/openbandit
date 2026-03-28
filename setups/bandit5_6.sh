mkdir /home/bandit5/inhere

# these files will be in each folder
filenames=(
    "-file1" ".file1" "-file2" ".file2" "-file3" ".file3"
    "spaces file1" "spaces file2" "spaces file3"
)

# generate directories and files
for i in {1..19}; do
  dir_path=/home/bandit5/inhere/maybeinhere$(printf %02d $i)
  mkdir $dir_path
  
  # generate the actual files
  for filename in "${filenames[@]}"; do
    file_path="$dir_path/$filename"
    # create random file sized at max ~3.2KB
    dd if=/dev/urandom of="$file_path" bs=1 count=$(( $RANDOM / 10 ))
    # assign random permission to file
    chmod "$(( $RANDOM % 8 ))$(( $RANDOM % 8 ))$(( $RANDOM % 8 ))" "$file_path"
  done
done

# make them all readable
chmod -R +r /home/bandit5/inhere/

# now, make real password file
real_file=/home/bandit5/inhere/maybeinhere07/-file1
# file length = full length (1033) - password_length
password_length=${#passwords[6]}
full_length=1033  # variable for readbility, fuck magic numbers
# create file with nulls and the password
echo "${passwords[6]}$(printf " %*s" $((full_length - password_length - 2)))" > "$real_file"
chmod -x "$real_file"  # make file not executable
