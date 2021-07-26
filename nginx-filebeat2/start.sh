#!/bin/bash

curl -XPUT -H "Content-Type: application/json" 'http://elk:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json

curl -XPUT -H "Content-Type: application/json" 'http://elk:9200/_template/metricbeat?pretty' -d@/etc/metricbeat/metricbeat.template.json

/etc/init.d/filebeat start
/etc/init.d/metricbeat start

nginx
tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log
