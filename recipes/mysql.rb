mysql_connection_info = {
  :host     => '127.0.0.1',
  :username => 'root',
  :password => 'mypassword'
}

mysql2_chef_gem 'exampleloginapp' do
  action :install
end

mysql_service 'examplelogin' do
  version '5.7'
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/data'
  initial_root_password 'mypassword'
  action [:create, :start]
end

mysql_database_user 'tutorialuser' do
  connection mysql_connection_info
  password   'tutorialmy5ql'
  host '%'
  action     :grant
end
