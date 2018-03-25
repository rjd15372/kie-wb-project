# Hello Kie Server

The code and commands were adapted from:
http://www.mastertheboss.com/jboss-jbpm/jbpm6/running-rules-on-wildfly-with-kie-server

## Deploy

```
$ mvn -s settings.xml deploy
$ mvn kieserver:deploy
```

## Running Drools rules

```
$ curl -X POST -H 'X-KIE-ContentType: JSON' -H 'Content-type: application/json' -u 'admin:admin' -d '{"commands": [{"insert": {"object": "William"}}, {"insert": {"object": "Francesco"}}, {"fire-all-rules": {}}]}' http://localhost:8080/kie-server/services/rest/server/containers/instances/org.x:hello-kie-server:1.0
```

Excpected output:

```
{
  "type" : "SUCCESS",
  "msg" : "Container org.x:hello-kie-server:1.0 successfully called.",
  "result" : {
    "execution-results" : {
      "results" : [ ],
      "facts" : [ ]
    }
  }
}
```

Check application log for the output:

```
appserver_1  | 09:53:59,677 INFO  [stdout] (default task-33) Hello Francesco
appserver_1  | 09:53:59,677 INFO  [stdout] (default task-33) Hello William
```

## Running Process Hello

```
$ curl -X POST -H 'Content-type: application/json' -H 'X-KIE-ContentType: JSON' -u 'admin:admin' -d '{"name": "William"}' http://localhost:8080/kie-server/services/rest/server/containers/org.x:hello-kie-server:1.0/processes/hello/instances
```

Excpected output:

```
<process_id>
```

Check application server log for the output:

```
appserver_1  | 09:58:09,071 INFO  [stdout] (default task-39) Hello World from process, William!
```

## Delete the kie container (undeploy)

```
$ curl -X DELETE -H 'Content-type: application/xml' -u 'admin:admin' http://localhost:8080/kie-server/services/rest/server/containers/org.x:hello-kie-server:1.0
```

