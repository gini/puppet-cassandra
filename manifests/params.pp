class cassandra::params {

    $java_class = $::cassandra_java_class ? {
        undef   => 'DISABLED',
        default => $::cassandra_java_class
    }

    $repo_name = $::cassandra_repo_name ? {
        undef   => 'datastax',
        default => $::cassandra_repo_name
    }

    $repo_baseurl = $::cassandra_repo_baseurl ? {
        undef   => $::lsbdistcodename ? {
            '^(squeeze|lucid|precise)$' => 'http://debian.datastax.com/community',
            default                     => fail("The distribution ${::lsbdistcodename} is not supported by this module")
        },
        default => $::cassandra_repo_baseurl
    }

    $repo_gpgkey = $::cassandra_repo_gpgkey ? {
        undef   => $::lsbdistcodename ? {
            '^(squeeze|lucid|precise)$' => 'http://debian.datastax.com/debian/repo_key',
            default                     => fail("The distribution ${::lsbdistcodename} is not supported by this module")
        },
        default => $::cassandra_repo_gpgkey
    }

    $repo_repos = $::cassandra_repo_repos ? {
        undef   => 'main',
        default => $::cassandra_repo_release
    }

    $repo_release = $::cassandra_repo_release ? {
        undef   => 'stable',
        default => $::cassandra_repo_release
    }

    $repo_pin = $::cassandra_repo_pin ? {
        undef   => 200,
        default => $::cassandra_repo_release
    }

    $repo_gpgcheck = $::cassandra_repo_gpgcheck ? {
        undef   => 0,
        default => $::cassandra_repo_gpgcheck
    }

    $repo_enabled = $::cassandra_repo_enabled ? {
        undef   => 1,
        default => $::cassandra_repo_enabled
    }

    case $::osfamily {
        'Debian': {
            $package_name = $::cassandra_package_name ? {
                undef   => 'dsc1.1',
                default => $::cassandra_package_name,
            }

            $service_name = $::cassandra_service_name ? {
                undef   => 'cassandra',
                default => $::cassandra_service_name,
            }
        }
        default: {
            fail("Unsupported osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
        }
    }

    $max_heap_size = $::cassandra_max_heap_size ? {
        undef   => '',
        default => $::cassandra_max_heap_size,
    }

    $heap_newsize = $::cassandra_heap_newsize ? {
        undef   => heap_newsize,
        default => $::cassandra_heap_newsize,
    }

    $stack_size = $::cassandra_stack_size ? {
        undef   => '160k',
        default => $::cassandra_stack_size,
    }

    $jmx_port = $::cassandra_jmx_port ? {
        undef   => 7199,
        default => $::cassandra_jmx_port,
    }

    $additional_jvm_opts = $::cassandra_additional_jvm_opts ? {
        undef   => [],
        default => $::cassandra_additional_jvm_opts,
    }

    $cluster_name = $::cassandra_cluster_name ? {
        undef   => 'Cassandra',
        default => $::cassandra_cluster_name,
    }

    $listen_address = $::cassandra_listen_address ? {
        undef   => $::ipaddress,
        default => $::cassandra_listen_address,
    }

    $rpc_address = $::cassandra_rpc_address ? {
        undef   => '0.0.0.0',
        default => $::cassandra_rpc_address,
    }

    $rpc_port = $::cassandra_rpc_port ? {
        undef   => 9160,
        default => $::cassandra_rpc_port,
    }

    $rpc_server_type = $::cassandra_rpc_server_type ? {
        undef   => 'hsha',
        default => $::cassandra_rpc_server_type,
    }

    $storage_port = $::cassandra_storage_port ? {
        undef   => 7000,
        default => $::cassandra_storage_port,
    }

    $partitioner = $::cassandra_partitioner ? {
        undef   => 'org.apache.cassandra.dht.RandomPartitioner',
        default => $::cassandra_partitioner,
    }

    $data_file_directories = $::cassandra_data_file_directories ? {
        undef   => ['/var/lib/cassandra/data'],
        default => $::cassandra_data_file_directories,
    }

    $commitlog_directory = $::cassandra_commitlog_directory ? {
        undef   => '/var/lib/cassandra/commitlog',
        default => $::cassandra_commitlog_directory,
    }

    $saved_caches_directory = $::cassandra_saved_caches_directory ? {
        undef   => '/var/lib/cassandra/saved_caches',
        default => $::cassandra_saved_caches_directory,
    }

    $initial_token = $::cassandra_initial_token ? {
        undef   => '',
        default => $::cassandra_initial_token,
    }

    $seeds = $::cassandra_seeds ? {
        undef   => [],
        default => $::cassandra_seeds,
    }

    $default_concurrent_reads = $::processorcount * 8
    $concurrent_reads = $::cassandra_concurrent_reads ? {
        undef   => $default_concurrent_reads,
        default => $::cassandra_concurrent_reads,
    }

    $default_concurrent_writes = $::processorcount * 8
    $concurrent_writes = $::cassandra_concurrent_writes ? {
        undef   => $default_concurrent_writes,
        default => $::cassandra_concurrent_writes,
    }

    $incremental_backups = $::cassandra_incremental_backups ? {
        undef   => 'false',
        default => $::cassandra_incremental_backups,
    }

    $snapshot_before_compaction = $::cassandra_snapshot_before_compaction ? {
        undef   => 'false',
        default => $::cassandra_snapshot_before_compaction,
    }

    $auto_snapshot = $::cassandra_auto_snapshot ? {
        undef   => 'true',
        default => $::cassandra_auto_snapshot,
    }

    $multithreaded_compaction = $::cassandra_multithreaded_compaction ? {
        undef   => 'false',
        default => $::cassandra_multithreaded_compaction,
    }

    $endpoint_snitch = $::cassandra_endpoint_snitch ? {
        undef   => 'SimpleSnitch',
        default => $::cassandra_endpoint_snitch,
    }
}
