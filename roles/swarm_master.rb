name "swarm_master"
description "Setup for Swarm Master"

run_list(
  "recipe[exampleloginapp::swarm_master]"
)

override_attributes(
)
