#!/bin/bash

read -r -d '' DATA << EOM
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<container-spec-details>
    <container-id>org.x:hello-kie-server:1.0</container-id>
    <container-name>org.x:hello-kie-server:1.0</container-name>
    <release-id>
        <artifact-id>hello-kie-server</artifact-id>
        <group-id>org.x</group-id>
        <version>1.0</version>
    </release-id>
    <configs>
        <entry>
            <key>PROCESS</key>
            <value xsi:type="processConfig" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                <runtimeStrategy>SINGLETON</runtimeStrategy>
                <kbase></kbase>
                <ksession></ksession>
                <mergeMode>MERGE_COLLECTIONS</mergeMode>
            </value>
        </entry>
    </configs>
    <status>STARTED</status>
</container-spec-details>
EOM

curl -X PUT -H 'Content-type: application/xml' -u 'admin:admin' -d "$DATA" http://localhost:8080/jbpm-console/rest/controller/management/servers/kieserver1/containers/org.x:hello-kie-server:1.0

