class cassandra::repo::debian(
    $name,
    $location,
    $repos,
    $release,
    $key_source,
    $pin
) {
    apt::source { $name:
        location          => $location,
        release           => $release,
        repos             => $repos,
        key_source        => $key_source,
        pin               => $pin,
        include_src       => false,
    }
}
