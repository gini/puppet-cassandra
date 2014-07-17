class cassandra::repo::debian(
    $repo_name,
    $repo_key,
    $location,
    $repos,
    $release,
    $key_source,
    $pin
) {
    apt::source { $repo_name:
        location          => $location,
        release           => $release,
        repos             => $repos,
        key               => $repo_key,
        key_source        => $key_source,
        pin               => $pin,
        include_src       => false,
    }
}
