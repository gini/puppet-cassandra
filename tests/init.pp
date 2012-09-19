# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
class { 'cassandra':
  initial_token => 'deadbeefcafebabedeadbeefcafebabe00beef',
  cluster_name  => 'YourCassandraCluster',
  seeds         => [ '127.0.0.1', ],
}
