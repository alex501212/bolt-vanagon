platform "ubuntu-22.04-amd64" do |plat|
  plat.inherit_from_default
  plat.docker_run_args ['--tty', '--entrypoint=/bin/sh']
  plat.docker_image "amd64/ubuntu:24.04"
  plat.use_docker_exec true
  
  packages = %w(git)
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends #{packages.join(' ')}"
end
