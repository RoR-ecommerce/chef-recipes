name "web"
description "Web"
run_list(
  "role[base]",
  "recipe[nginx]"
)
