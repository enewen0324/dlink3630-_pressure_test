#!/bin/bash
up_l='curl -u onos:rocks -X POST -H "Content-type: application/json" -d'
up_l_g1='http://localhost:8181/onos/v1/groups/of:000078321bdf7600'
up_l_f1="'http://localhost:8181/onos/v1/flows?appId=app'"
up_l_m1="'http://localhost:8181/onos/v1/meters/of:000078321bdf7600'"
path=$1
for (( i=1; i<=5; i=i+1 ))
do
	if [ -f "test_group$i.json" ];then
		comd="$up_l @test_group$i.json $up_l_g1"
		eval "$comd"
	fi
done
for (( i=1; i<=5; i=i+1 ))
do
if [ -f "${path}/test_meter$i.json" ];then
	comd="$up_l @${path}/test_meter$i.json $up_l_m1"
	eval "$comd"
fi
done
for (( i=1; i<=5; i=i+1 ))
do
if [ -f "test_flow$i.json" ];then
	comd="$up_l @test_flow$i.json $up_l_f1"	
	eval "$comd"
fi
done

