# Bitlbee Puppet Module for Boxen

[![Build Status](https://travis-ci.org/lglenn/puppet-bitlbee.png?branch=master)](https://travis-ci.org/lglenn/puppet-bitlbee)

Install [Bitlbee](http://www.bitlbee.org/), an IRC to other networks gateway.

* Runs as a Launch Daemon.
* Configured to listen only to the localhost interface, as Bitlbee does have the ability to log into other networks as you.
* Listens on the standard port (6667), as this isn't really a dev thing.

## Usage

```puppet
include bitlbee
```

## Required Puppet Modules

* `boxen`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
