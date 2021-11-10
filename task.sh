#!/bin/bash
last_month="2021-11"
kibana_host="192.168.160.140:30001"
index_pattern_ids=$(curl -XGET http://$kibana_host/api/saved_objects/_find?type=index-pattern | jq  -r --arg last_month $last_month '.saved_objects | .[] | select(.attributes.title | contains($last_month)) | .id')
for index_pattern_id in $index_pattern_ids ; do
curl -X DELETE -H "kbn-version: 7.13.2" http://$kibana_host/api/index_patterns/index_pattern/$index_pattern_id
done