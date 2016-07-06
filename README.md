# Riak Mesos Framework

## Install

-   Append the DCOS Riak package repo to your DCOS repo sources:

        dcos config prepend package.sources https://github.com/basho-labs/riak-mesos-dcos-repo/archive/dcoscli-v0.3.x.zip

-   Update packages:

        dcos package update

-   Install the `dcos riak` subcommand:

        dcos package install riak --options /etc/riak-mesos/config.json


## Usage

For full usage instructions, see the instructions in [riak-mesos-tools](https://github.com/basho-labs/riak-mesos-tools#usage). Note that when installing via `dcos`, the `riak-mesos` command referenced can be substituted with `dcos riak` throughout.
