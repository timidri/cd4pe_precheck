plan cd4pe_precheck(
  TargetSpec $cd4pe_host,
  TargetSpec $cd4pe_jobs_host,
  TargetSpec $pe_host,
  String     $git_host,
) {
  # check connectivity from workstation to $cd4pe_host port 8080, 8443, 443
  run_plan( 'cd4pe_precheck::ports',
    remote_host => $cd4pe_host,
    ports       => [ 8080, 8443, 443 ],
  )
  # check connectivity from $cd4pe_host to PE master (8140, 8143, 8081, 4433, doublecheck in docs)
  run_plan( 'cd4pe_precheck::ports',
    root_host   => $cd4pe_host,
    remote_host => $pe_host,
    ports       => [ 8170, 8140, 8143, 8081, 4433 ]
  )
  # check connectivity from $cd4pe_host and $cd4pd_jobs_host to the git server
  run_plan( 'cd4pe_precheck::ports',
    root_host   => [ $cd4pe_host, $cd4pe_jobs_host ],
    remote_host => $git_hostname,
    ports       => [ 22, 443 ],
  )
  # check connectivity from $cd4pe_jobs_host to $cd4pd_host
  run_plan( 'cd4pe_precheck::ports',
    root_host   => $cd4pe_jobs_host,
    remote_host => $cd4pe_host,
    ports       => [ 8000, 8080, 8443, 7000 ],
  )
}
