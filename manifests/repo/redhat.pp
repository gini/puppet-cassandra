class cassandra::repo::redhat(
    $name,
    $baseurl,
    $gpgkey,
    $gpgcheck,
    $enabled
) {
    yumrepo { $name:
        descr    => 'DataStax Distribution for Cassandra',
        baseurl  => $baseurl,
        gpgkey   => $gpgkey,
        gpgcheck => $gpgcheck,
        enabled  => $enabled,
    }
}
