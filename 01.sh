#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit1@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "boJ9jbbUNNfktd78OOpsqOltutMc3MY1\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
send -- "cat ./-\r"

expect -re {\$ $}
send "exit\r"
