#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit11@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# The file 'data.txt' contains a ROT13 encoded string. To decode it, we pipe its
# contents (using cat) to the command tr, which translates any lower and
# uppercase letter ('A-za-z', from set 1), to the 13th letter after (set 2). tr
# sets taken from the wikipedia page on ROT13:
send -- "cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'\r"

expect -re {\$ $}
send "exit\r"
