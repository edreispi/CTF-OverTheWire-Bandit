#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit5@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "koReBOKuIDDepwhWk7jZC0RTdopnAYKh\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
send -- "cd inhere\r"
expect -re {\$ $}
# The first command uses du to list file sizes inside directories, this is then
# piped to grep where we search for the one that is 1033 bytes in size.
send -- "du -b -a | grep \"1033\"\r"
expect -re {\$ $}
# found to be file 2 inside maybehere07
send -- "cat maybehere07/.file2\r"

expect -re {\$ $}
send "exit\r"
