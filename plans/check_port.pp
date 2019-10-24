plan cd4pe_precheck::check_port(
  TargetSpec $nodes,
  TargetSpec $remote_host,
  Array[Integer] $ports,
){
  $ports.each |$port| {
    $target = get_targets($remote_host)[0]
    out::message("Checking ${port} on ${target.name}...")
  }
}
