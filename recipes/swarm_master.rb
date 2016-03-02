docker_service 'default' do
  action [:create, :start]
end

docker_image 'swarm' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[swarm_master]'
end

consul = search(:node, 'role:consul')
docker_container 'swarm_master' do
  repo 'swarm'
  port '4000:4000'
  command "manage -H :4000 --replication --advertise #{node["ipaddress"]}:4000 consul://#{consul[0].ipaddress}:8500"
end
