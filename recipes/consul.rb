docker_service 'default' do
  action [:create, :start]
end

docker_image 'progrium/consul' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[consul_master]'
end

docker_container 'consul_master' do
  repo 'progrium/consul'
  port '8500:8500'
  command "-server -bootstrap"
end
