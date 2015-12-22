#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit3@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
send -- "cd inhere\r"
expect -re {\$ $}
send -- "cat .hidden\r"

expect -re {\$ $}
send "exit\r"
