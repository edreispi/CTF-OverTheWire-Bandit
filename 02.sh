#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit2@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
send -- "cat spaces\\ in\\ this\\ filename\r"

expect -re {\$ $}
send "exit\r"
