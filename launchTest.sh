#!/bin/bash

curl --request POST --url "https://prod.cerberus-testing.com/AddToExecutionQueuePrivate" -d campaign=TestBCI -d tag=tutu -H "apikey : ${{ secrets.APIKEY }}"


num=0
while [ $num -lt 3 ]
do
    result=$(curl --request POST --url "https://prod.cerberus-testing.com/ResultCIV004" -d tag=tutu -H "apikey : ${{ secrets.APIKEY }}" | jq -r '.result')
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
