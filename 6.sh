#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit6@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "DXjZPULLxYr17uwoI01bNLQbtFemEgo7\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# use find with flags -group = bandit6, -user = bandit7, and size = 33 bytes (c)
# Output is cleaned up by sending all error messages (Permission denied, No such
# file or directory) to the null file located in /dev/null, so only the relevant
# location is outputted by stdout.
send -- "find / -group bandit6 -user bandit7 -size 33c 2>/dev/null\r"

expect -re {\$ $}
# File found to be 'bandit7.password' inside '/var/lib/dpkg/info' directory.
send -- "cat /var/lib/dpkg/info/bandit7.password\r"

expect -re {\$ $}
send "exit\r"
