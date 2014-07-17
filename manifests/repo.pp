class cassandra::repo (
    $repo_name,
    $repo_key,
    $baseurl,
    $gpgkey,
    $repos,
    $release,
    $pin,
    $gpgcheck,
    $enabled
){
    case $::osfamily {
        'Debian': {
            class { 'cassandra::repo::debian':
                repo_name  => $repo_name,
                repo_key  => $repo_key,
                location   => $baseurl,
                repos      => $repos,
                release    => $release,
                key_source => $gpgkey,
                pin        => $pin,
            }
        }
        'RedHat': {
            class { 'cassandra::repo::redhat':
                repo_name => $repo_name,
                baseurl   => $baseurl,
                gpgkey    => $gpgkey,
                gpgcheck  => $gpgcheck,
                enabled   => $enabled,
            }
        }
        default: {
            fail("OS family ${::osfamily} not supported")
        }
    }
}
