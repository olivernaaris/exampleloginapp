include_recipe "selinux::disabled"

mysql_service 'default' do
  version '5.7'
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/data'
  initial_root_password 'mypassword'
  action [:create, :start]
end
