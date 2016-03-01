name "swarm_slave"
description "Setup for Swarm Slave"

run_list(
  "recipe[exampleloginapp::swarm_slave]"
)

override_attributes(
)
