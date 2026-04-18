file_path=/home/bandit9/data.txt

line_count=75
file_content=""

# get 3 random numbers in the range, then sort them w/ delimeter $IFS, and set *that* as the array 
lines=(
  $(( $RANDOM % $line_count ))
  $(( $RANDOM % $line_count ))
  $(( $RANDOM % $line_count ))
  $(( $RANDOM % $line_count ))
)
# sort the array
IFS=$'\n' lines=($(sort -n <<<"${lines[*]}"))
# make sure there are no duplicates
for j in $(seq 1 ${!array[@]}); do
  if [ ${array[$j]} -eq ${array[$(($j - 1))]} ]; then
    ((array[$j]++))
  fi
done
# now the lines
line_content=(
  "====== the"
  "====== password"
  "====== is"
  "====== ${passwords[10]}"
)
counter=0


for i in $(seq 1 $line_count); do
  dd if=/dev/urandom of="/tmp/bestfile.txt" bs=1 count=$(( $RANDOM / 1000 ))  # up to 32
  file_content="$file_content\n$(cat /tmp/bestfile.txt)"
  if [[ $i -eq ${lines[$counter]} ]]; then
    file_content="$file_content${line_content[$counter]}\n"
    ((counter++))  # apparently you can do that?? just found out
  fi
done

echo $file_content > $file_path
