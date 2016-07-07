# Riak Mesos Framework

## Install

- Add the DCOS Riak package to your DCOS repository sources:

		dcos package repo add Riak https://github.com/basho-labs/riak-mesos-dcos-repo/archive/dcoscli-v0.4.x.zip

	NB: you may need to remove and re-add `Universe` afterwards for the Riak package to show up in `dcos package search riak`

- Install the `dcos riak` subcommand:

		dcos package install riak --options /etc/riak-mesos/config.json


## Usage

For full usage instructions, see the instructions in [riak-mesos-tools](https://github.com/basho-labs/riak-mesos-tools#usage). Note that when installing via `dcos`, the `riak-mesos` command referenced can be substituted with `dcos riak` throughout.
