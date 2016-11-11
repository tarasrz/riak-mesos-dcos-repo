{
    "id":"{{riak.framework-name}}",
    "instances": {{riak.instances}},
    "cpus": {{riak.scheduler.cpus}},
    "mem": {{riak.scheduler.mem}},
    "ports":[ 0 ],
    {{! Generated field }}
    "fetch": "{{FETCH}}",
    "cmd":"./riak_mesos_scheduler/bin/ermf-scheduler",
    {{#riak.constraints}}"constraints": {{{riak.constraints}}},{{/riak.constraints}}
    "env": {
        "RIAK_MESOS_NAME": "{{riak.framework-name}}"
        ,"RIAK_MESOS_ZK": "{{riak.zk}}"
        ,"RIAK_MESOS_MASTER": "{{riak.master}}"
        ,"RIAK_MESOS_USER": "{{riak.user}}"
        ,"RIAK_MESOS_DIRECTOR_CPUS": "{{riak.director.cpus}}"
        ,"RIAK_MESOS_DIRECTOR_MEM": "{{riak.director.mem}}"
        {{! Generated field }}
        ,"RIAK_MESOS_RESOURCE_URLS": "{{RIAK_MESOS_RESOURCE_URLS}}"
        {{#riak.director.use-public}},"RIAK_MESOS_DIRECTOR_PUBLIC": "{{riak.director.use-public}}"{{/riak.director.use-public}}
        {{#riak.scheduler.constraints}},"RIAK_MESOS_CONSTRAINTS": "{{riak.scheduler.constraints}}"{{/riak.scheduler.constraints}}
        {{#riak.auth-principal}},"RIAK_MESOS_PRINCIPAL": "{{riak.auth-principal}}"{{/riak.auth-principal}}
        {{#riak.auth-provider}},"RIAK_MESOS_PROVIDER": "{{riak.auth-provider}}"{{/riak.auth-provider}}
        {{#riak.auth-secret-file}},"RIAK_MESOS_SECRET_FILE": "{{riak.auth-secret-file}}"{{/riak.auth-secret-file}}
        {{#riak.role}},"RIAK_MESOS_ROLE": "{{riak.role}}"{{/riak.role}}
        {{#riak.ip}},"RIAK_MESOS_IP": "{{riak.ip}}"{{/riak.ip}}
        {{#riak.hostname}},"RIAK_MESOS_HOSTNAME": "{{riak.hostname}}"{{/riak.hostname}}
        {{#riak.failover-timeout}},"RIAK_MESOS_FAILOVER_TIMEOUT": "{{riak.failover-timeout}}"{{/riak.failover-timeout}}
        {{#riak.node.cpus}},"RIAK_MESOS_NODE_CPUS": "{{riak.node.cpus}}"{{/riak.node.cpus}}
        {{#riak.node.mem}},"RIAK_MESOS_NODE_MEM": "{{riak.node.mem}}"{{/riak.node.mem}}
        {{#riak.node.disk}},"RIAK_MESOS_NODE_DISK": "{{riak.node.disk}}"{{/riak.node.disk}}
        {{#riak.executor.cpus}},"RIAK_MESOS_EXECUTOR_CPUS": "{{riak.executor.cpus}}"{{/riak.executor.cpus}}
        {{#riak.executor.mem}},"RIAK_MESOS_EXECUTOR_MEM": "{{riak.executor.mem}}"{{/riak.executor.mem}}
    },
    "healthChecks": [
    {
      "path": "/healthcheck",
      "portIndex": 0,
      "protocol": "HTTP",
      "gracePeriodSeconds": {{riak.healthcheck-grace-period-seconds}},
      "intervalSeconds": {{riak.healthcheck-interval-seconds}},
      "timeoutSeconds": {{riak.healthcheck-timeout-seconds}},
      "maxConsecutiveFailures": {{riak.healthcheck-max-consecutive-failures}},
      "ignoreHttp1xx": false
    }],
    "labels": {
        "DCOS_PACKAGE_FRAMEWORK_NAME": "{{riak.framework-name}}"
    }
}