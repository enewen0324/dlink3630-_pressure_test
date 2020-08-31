#!/bin/bash
path=$1
if [ -f "test_flow1.json" ];then
	curl -u onos:rocks -X DELETE --header 'Accept: application/json' 'http://localhost:8181/onos/v1/flows/application/app'
fi
for (( i=5 ; i>=1 ; i=i-1))
do
	if [ -f "test_group$i.json" ];then
		curl -u onos:rocks -X DELETE --header 'Accept: application/json' "http://localhost:8181/onos/v1/groups/of%3A000078321bdf7600/0x${i}234abc3"
	fi
done
if [ -f "${path}/test_meter1.json" ];then
	curl -u onos:rocks -X DELETE --header 'Accept: application/json' 'http://localhost:8181/onos/v1/meters/of%3A000078321bdf7600/1'
fi
