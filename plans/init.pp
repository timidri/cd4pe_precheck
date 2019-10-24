plan cd4pe_precheck(
  TargetSpec $cd4pe_host,
  TargetSpec $pe_host,
  String $git_hostname,
  Optional[TargetSpec] $db_host = $cd4pe_host,
  Optional[Enum['mysql','postgresql']] $db_type = 'postgresql',
){
# check whether $cd4pe_host exists?
# ...
# check connectivity from workstation to $cd4pe_host port 8080, 8443, 443
run_plan('cd4pe_precheck::check_ports',
  nodes=>localhost,
  remote_host=>$cd4pe_host,
  ports=>[8080,8443,443]
  )
# check local requirements on $cd4pe_host
# ...
# check connectivity from $cd4pe_host to PE master (8140, 8143, 8081, 4433, doublecheck in docs)
run_plan('cd4pe_precheck::check_ports',
  nodes=>$cd4pe_host,
  remote_host=>$pe_host,
  ports=>[8140, 8143, 8081, 4433]
  )
# check connectivity from $cd4pe_host to the git server
run_plan('cd4pe_precheck::check_ports',
  nodes=>$cd4pe_host,
  remote_host=>$git_hostname,
  ports=>[22, 443]
  )
}
