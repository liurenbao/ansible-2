#!/bin/bash
year_month=$(date '+%Y-%m')
indices=$(curl http://192.168.160.36:9200/_cat/indices/log-*-$year_month-* | cut -d ' ' -f3)
for index in $indices[*]; do
    index_prefix=${index%${year_month}*}
    pattern=$index_prefix$year_month-*
    curl -XPOST -d@- --url http://192.168.160.36:30001/api/index_patterns/index_pattern -H "Content-Type: application/json" -H "kbn-version: 7.13.2" << EOF
    {
      "index_pattern": {
        "title": "$pattern",
        "timeFieldName": "@timestamp",
        "sourceFilters": [],
        "typeMeta": {},
        "fieldFormats": {},
        "fieldAttrs": {
          "message": {
            "count": 1
          }
        },
        "allowNoIndex": false
      }
    }
    EOF

done