plan cd4pe_precheck::check_ports(
  TargetSpec $nodes,
  TargetSpec $remote_host,
  Array[Integer] $ports,
){
  $ports.each |$port| {
    $target = get_targets($remote_host)[0]
    out::message("Plan: checking ${port} on ${target.name}...")
    $result = run_task('cd4pe_precheck::check_port', $nodes, host=>$target.name, port=>$port)[0]
    out::message($result.message)
  }
}
