#!/bin/bash -e

exec su puppetdb -s /bin/bash -c "/usr/lib/jvm/java-7-openjdk-amd64/bin/java -XX:OnOutOfMemoryError='kill -9 %p' -Xmx192m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log/puppetdb/puppetdb-oom.hprof -Djava.security.egd=file:/dev/urandom -cp /usr/share/puppetdb/puppetdb.jar clojure.main -m com.puppetlabs.puppetdb.core services -c /etc/puppetdb/conf.d"

