name "app"
description "App"
run_list(
  "role[base]",
  "recipe[nodejs]",
  "recipe[ssh_known_hosts]",
  "recipe[bundler]",
  "recipe[ufcfit-oauth-provider]"
)

default_attributes(
  'nodejs' => {
    'install_method' => 'package'
  }
)
