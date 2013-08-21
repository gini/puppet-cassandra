Puppet Cassandra module (DataStax edition)
==========================================

[![Build Status](https://secure.travis-ci.org/gini/puppet-cassandra.png)](http://travis-ci.org/gini/puppet-cassandra)

Overview
--------

Install Apache Cassandra from the [DataStax](http://www.datastax.com/) distribution.

Usage
-----

Example:

    class { 'cassandra':
        cluster_name      => 'YourCassandraCluster',
        seeds             => [ '192.0.2.5', '192.0.2.23', '192.0.2.42', ],
        num_tokens        => '256',
        listen_address    => $ec2_local_ipv4,
        broadcast_address => $ec2_public_ipv4,
        endpoint_snitch   => 'Ec2MultiRegionSnitch',
    }

Supported Platforms
-------------------

The module has been tested on the following operating systems. Testing and patches for other platforms are welcomed.

* Debian 6.0 (Squeeze) and Debian 7.0 (Wheezy)

License
-------

Copyright (c) 2012-2013 smarchive GmbH, 2013 Gini GmbH

This script is licensed under the Apache License, Version 2.0.

See http://www.apache.org/licenses/LICENSE-2.0.html for the full license text.

Support
-------

Please log tickets and issues at our [project site](https://github.com/gini/puppet-cassandra/issues).
