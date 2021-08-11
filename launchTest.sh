#!/bin/bash

curl --request POST --url "https://prod.cerberus-testing.com/AddToExecutionQueuePrivate" -d campaign=TestBCI -d tag=tutu --cookie "JSESSIONID=B406EC02B7FE44F76240BEDE70C6B93C"


num=0
while [ $num -lt 3 ]
do
    result=$(curl --request POST --url "https://prod.cerberus-testing.com/ResultCIV004" -d tag=tutu --cookie "JSESSIONID=B406EC02B7FE44F76240BEDE70C6B93C" | jq -r '.result')
    echo $result
    if [[ "$result" != "PE" ]]; then
        break
    fi
    sleep 3
    echo "One more try"
done

if [[ "$result" != "OK" ]]; then
    exit 1
fi
echo $result
