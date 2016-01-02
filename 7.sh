#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit7@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# search for the line that contains the word "millionth", output shows the
# desired line containing the flag.
send "grep 'millionth' data.txt\r"

expect -re {\$ $}
send "exit\r"
