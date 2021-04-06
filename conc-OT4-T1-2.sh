#!/bin/bash
#Discord = Emre NOP#7479
#Before run script install expect package to your OS.
#This is bash script not sh. please run with ./ 

#Below should be address not account name !!
receiver="4HgPsnTzHSQjhykpQuqhDwxfEvCfu49NhXjqjF53fnwb8sfnNx"
#Below should be address not account name !!
sender="4kLX37oJEasZdupBcDhD56edTJ3FLzQ4zyUGZM5PyPdL6G727z"
pass="438484\r\n"

#cron sample. 
#13 17,18,19,20,21   * * * /home/concordium/Documents/concordium-software/conc-OT4-T1-2.sh

#Update conc part with your username
cd home/concordium/Documents/concordium-software
for i in {1..121}
do
  echo "TX - $1"
#Simple TX
/usr/bin/expect << EOF  >> T1.log
set timeout -1
spawn ./concordium-client --grpc-ip 127.0.0.01 --grpc-port 10000 transaction send-gtu --amount 0.1 --receiver "$receiver" --sender "$sender" --no-confirm --no-wait

expect "Enter password for signing key:"
send -- $pass
expect eof

EOF

done
