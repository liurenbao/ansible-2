#!/bin/bash

namespaces=`kubectl get ns | grep -v NAME | cut -d ' ' -f1`
for namespace in ${namespaces}; do
    echo count_pod_restarts($namespace);
done


function count_pod_restarts(namespace) {
    sum=0
    counts=$(kubectl get pod -n $namespace | grep -v RESTARTS | awk '{print $4}')
    for count in $counts ; do
        sum+=$count
    done
    return sum
}