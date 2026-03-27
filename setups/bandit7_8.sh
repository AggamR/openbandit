words=/usr/share/dict/words
file_path=/home/bandit7/data.txt

line_count=100
correct_word=millionth

file_content=""
correct_line=$(( $RANDOM % $line_count ))  # choose line with word and password

for i in $(seq 1 $line_count); do
  word=$(cat /usr/share/dict/words | tail -n $RANDOM | head -n 1)  # generate random word
  pass=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | head -c 16; echo)  # generate password-like
  # if is the lucky line-  make it
  if [ $i -eq $correct_line ]; then
    word=$correct_word
    pass=${passwords[8]}
  fi
  file_content="$file_content\n$word\t$pass"  # rebuild string
done

echo -e $file_content > $file_path
