class cassandra::config {
    group { 'cassandra':
        ensure  => present,
        require => Class['cassandra::install'],
    }

    user { 'cassandra':
        ensure  => present,
        require => Group['cassandra'],
    }

    File {
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Class['cassandra::install'],
    }

    file { '/etc/cassandra/cassandra-env.sh':
        ensure  => file,
        content => template("${module_name}/cassandra-env.sh.erb"),
    }

    file { '/etc/cassandra/cassandra.yaml':
        ensure  => file,
        content => template("${module_name}/cassandra.yaml.erb"),
    }
}
