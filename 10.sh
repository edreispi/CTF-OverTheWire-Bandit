#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit10@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# The file 'data.txt' contains a base64 encoded string, which can be decoded
# using the command 'base64' with flag '-d':
send -- "base64 -d data.txt\r"

expect -re {\$ $}
send "exit\r"
