docker_service 'default' do
  daemon
  action [:create, :start]
end

docker_service_manager_upstart 'default' do
  host ['unix:///var/run/docker.sock', 'tcp://0.0.0.0:2375']
  action :start
end

docker_image 'swarm' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[swarm_slave]'
end

consul = search(:node, 'role:consul')
docker_container 'swarm_slave' do
  repo 'swarm'
  command "join --advertise #{node["ipaddress"]}:2375 consul://#{consul[0].ipaddress}:8500"
end
