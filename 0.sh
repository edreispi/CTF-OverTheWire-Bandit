#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit0@bandit.labs.overthewire.org

# matches password after initial message: 
expect "*?password:*"

# sends password 'bandit0'
send -- "bandit0\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
send -- "cat readme\r"

expect -re {\$ $}
send "exit\r"

