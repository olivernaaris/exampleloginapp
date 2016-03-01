name "consul"
description "Setup for consul"

run_list(
  "recipe[exampleloginapp::consul]"
)

override_attributes(
)
