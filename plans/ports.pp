plan cd4pe_precheck::ports(
  TargetSpec                                      $root_host = Target('localhost', 'config' => { 'transport' => 'local'}),
  Variant[TargetSpec, Array[TargetSpec], String]  $remote_host,
  Variant[Integer, Array[Integer]]                $ports,
) {

  return $results = [$root_host].flatten.map |$r_h| {
    [$ports].flatten.map |$p| {
      $target = get_targets($remote_host)[0]
      $host = get_targets($r_h)[0]
      $result = run_task('cd4pe_precheck::check_port', $host.name, 'host' => $target.name, 'port' => $p, '_catch_errors' => true)[0]
    }
  }
}
