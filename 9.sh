#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit9@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# The first command (strings) parses the file (data.txt) to find all human
# readable strings. This output is then piped to grep, where we search for the
# lines containing 4 or more '='. The flag is found at the end of the output:
send -- "strings data.txt | grep -E '={4,}'\r"

expect -re {\$ $}
send "exit\r"
