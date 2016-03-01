#docker_installation_binary 'default' do
#  version '1.10.2'
#  source 'https://get.docker.com/builds/Linux/x86_64/docker-1.10.2'
#  checksum '3fcac4f30e1c1a346c52ba33104175ae4ccbd9b9dbb947f56a0a32c9e401b768'
#  action :create
#end

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
