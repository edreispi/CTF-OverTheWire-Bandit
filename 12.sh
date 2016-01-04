#!/usr/bin/expect -f

# initial ssh command:
spawn ssh bandit12@bandit.labs.overthewire.org

# matches password after initial message:
expect "*?password:*"

# sends password recovered from last level
send -- "5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu\r"

# regular expression to check for prompt
expect -re {\$ $}

# solution:
# This level is long!

# First, we follow the directions on the website and create our own temporary
# directory to store a copy of the 'data.txt' file:
send -- "mkdir /tmp/level12work\r"
# We copy the 'data.txt' file to this new directory:
expect -re {\$ $}
send -- "cp data.txt /tmp/level12work\r"
# And then we switch to the temporary directory:
expect -re {\$ $}
send -- "cd /tmp/level12work\r"

# Now we have to revert the hexdump. This is done by using the xxd command with
# flag '-r'. We store the binary file as 'flag.txt':
expect -re {\$ $}
send -- "xxd -r data.txt flag.txt\r"

# We now rename the flag.txt file to add the gzip extension (.gz) in order to
# uncompress it once. This I found after trial and error, however, it is
# possible to find the type of file using zcat to uncompress instead of gzip or
# bzip.
expect -re {\$ $}
send -- "mv flag.txt flag.txt.gz\r"

# Uncompress the gzip file:
expect -re {\$ $}
send -- "gunzip flag.txt.gz\r"

# The new flag.txt is at a stage where we are faced with a compressed bzip2
# archive. We start by renaming the file to include the bzip2 extension:
expect -re {\$ $}
send -- "mv flag.txt flag.txt.bz2\r"

# Now we uncompress the bzip2 file:
expect -re {\$ $}
send -- "bunzip2 flag.txt.bz2\r"

# We can treat the resulting file as either a tar ball or a gzip file. This
# solution renames it to a gzip file and unzips it:
expect -re {\$ $}
send -- "mv flag.txt flag.txt.gz\r"
expect -re {\$ $}
send -- "gunzip flag.txt.gz\r"

# The resulting decompressed file is a tar ball containing a 'data5.bin' file.
# To extract it we rename the 'flag.txt' file to include the .tar extension and
# then uncompress it using the 'tar' command with flags x,v, and f:
expect -re {\$ $}
send -- "mv flag.txt flag.txt.tar\r"
expect -re {\$ $}
send -- "tar -xvf flag.txt.tar\r"

# The data5.bin file is another tarball containing a data6.bin file. We follow
# the same renaming and untaring procedure as above:
expect -re {\$ $}
send -- "mv data5.bin data5.bin.tar\r"
expect -re {\$ $}
send -- "tar -xvf data5.bin.tar\r"

# The resulting 'data6.bin' file is a bzip2 compressed file. We rename and unzip
# accordingly:
expect -re {\$ $}
send -- "mv data6.bin data6.bin.bz2\r"
expect -re {\$ $}
send -- "bunzip2 data6.bin.bz2\r"

# The unzipped 'data6.bin' file is a tarball containing a 'data8.bin'. We can
# untar directly to get this file (no need to rename like I did above):
expect -re {\$ $}
send -- "tar -xvf data6.bin\r"

# 'data8.bin' is now a gzip compressed file. We rename and unzip:
expect -re {\$ $}
send -- "mv data8.bin data8.bin.gz\r"
expect -re {\$ $}
send -- "gunzip data8.bin.gz\r"

# We finally got the final password file! And it is all revealed with a simple
# cat:
expect -re {\$ $}
send -- "cat data8.bin\r"

# Delete temporary directory before disconnecting:
expect -re {\$ $}
send -- "rm -r /tmp/level12work\r"

expect -re {\$ $}
send "exit\r"
