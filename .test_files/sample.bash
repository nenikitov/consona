# Sample bash code
#!/bin/bash

file="test.txt"
counter=1

mkdir -p "$dir"
echo "This is a test file" > "${file}"

echo {A..Z}
echo {1..10}

x=10
((sum=x + 20))
echo "Sum of $x and $y is $sum"

string="Hello World"
echo "Length of string: ${#string}"
echo "Substring: ${string:6:5}"
echo "Replace: ${string/World/Bash}"

if [[ -f "$file" ]]; then
    echo "File $file exists."
else
    echo "File $file does not exist."
fi

for num in {1..10}; do
    if ((num % 2 == 0)); then
        echo "Number $num is even."
    else
        echo "Number $num is odd."
    fi
done

while ((counter <= max_count)); do
    echo "Counter is $counter"
    ((counter++))
done
for i in {1..5}; do
    echo "This is file number $i" > "$dir/file_$i.txt"
done
for file_path in "$dir"/*.txt; do
    echo "Contents of $file_path:"
    cat "$file_path" || echo "Failed to read $file_path"
done

echo "Enter a color:"
read color
case $color in
    red) echo "You chose red." ;;
    *)
        echo "Unknown color."
        exit 1
        ;;
esac

echo "This is a second test file" > "$dir/second_test.txt"
ls -l "$dir" | tee "$file" > /dev/null
uppercase_file=$(cat "$file" | tr '[:lower:]' '[:upper:]')
echo "Appended text to file" >> "$file"

function factorial() {
    local n=$1
    local result=1
    while ((n > 1)); do
        result=$((result * n))
        ((n--))
    done
    echo $result
}

echo "Factorial of 5 is $(factorial 5)"

local_example() {
    local local_var="I'm local"
    echo $local_var
}
local_example 

cat << EOF > "$dir/heredoc_test.txt"
This is a test of the here document.
It can span multiple lines.
Here we also test variables and commands inside the heredoc.

List of files in the current directory:
$(ls)

The value of the counter is $counter and the max_count is $max_count.

End of the heredoc section.
EOF

select option in "Start Process" "Exit"; do
    case $option in
        "Start Process") echo "Starting process..."; break;;
        "Exit") echo "Exiting..."; break;;
        *) echo "Invalid option";;
    esac
done

diff <(echo "Hello") <(echo "Hello World")

chmod 755 "$file"
source ~/.bashrc 2>/dev/null

declare -a arr=("apple" "banana" "cherry")
declare -A assoc_array
assoc_array=( ["apple"]="red" ["banana"]="yellow" ["grape"]="purple" )
echo "Array elements:"
for fruit in "${arr[@]}"; do
    echo "$fruit"
done
