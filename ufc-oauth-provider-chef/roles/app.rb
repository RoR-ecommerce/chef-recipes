name "app"
description "App"
run_list(
  "role[base]",
  "recipe[nodejs]"
)

default_attributes(
  'nodejs' => {
    'install_method' => 'package'
  }
)
