#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit4@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "pIwrPrtPN36QITSp3EQaw936yaFoFgAB\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
send -- "cd inhere\r"
expect -re {\$ $}
# the first command lists information about all the files in the directory, this
# is piped to grep to find the file containing 'text' instead of 'data'
send -- "file ./-* | grep \"text\"\r"
expect -re {\$ $}
# answer is file07:
send -- "cat ./-file07\r"

expect -re {\$ $}
send "exit\r"
