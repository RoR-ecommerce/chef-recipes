name "base"
description "Base"
run_list(
  "recipe[build-essential]",
  "recipe[git]"
)
