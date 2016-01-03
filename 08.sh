#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit8@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "cvX2JJa4CFALtqS87jk27qwqGhBM9plV\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# The first command sorts the data.txt file so duplicate lines are under each
# other, and then this is piped to uniq, which looks for the only unique line
# using flag -u:
send -- "sort data.txt | uniq -u\r"

expect -re {\$ $}
send "exit\r"
