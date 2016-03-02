name "mysql"
description "Setup for MySql"

run_list(
  "recipe[exampleloginapp::mysql]"
)

override_attributes(
)
