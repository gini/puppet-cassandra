class cassandra::config(
    $max_heap_size,
    $heap_newsize,
    $jmx_port,
    $additional_jvm_opts,
    $cluster_name,
    $listen_address,
    $rpc_address,
    $rpc_port,
    $rpc_server_type,
    $storage_port,
    $partitioner,
    $data_file_directories,
    $commitlog_directory,
    $saved_caches_directory,
    $initial_token,
    $seeds,
    $concurrent_reads,
    $concurrent_writes,
    $incremental_backups,
    $snapshot_before_compaction,
    $auto_snapshot,
    $multithreaded_compaction,
    $endpoint_snitch
) {
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
