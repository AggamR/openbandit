file_path=/var/lib/dpkg/info/bandit7.password

mkdir -p /var/lib/dpkg/info 2&> /dev/null  # incase this isn't running on debian

# file length = full length (33) - password_length
password_length=${#passwords[7]}
full_length=33  # variable for readbility, fuck magic numbers
echo "${passwords[7]}$(printf " %*s" $((full_length - password_length - 2)))" > $file_path
chown bandit7:bandit6 $file_path
