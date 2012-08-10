class cassandra::repo (
    $name,
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
                name       => $name,
                location   => $baseurl,
                repos      => $repos,
                release    => $release,
                key_source => $gpgkey,
                ping       => $pin,
            }
        }
        'RedHat': {
            class { 'cassandra::repo::redhat':
                name     => $name,
                baseurl  => $baseurl,
                gpgkey   => $gpgkey,
                gpgcheck => $gpgcheck,
                enabled  => $enabled,
            }
        }
        default: {
            fail("OS family ${::osfamily} not supported")
        }
    }
}
