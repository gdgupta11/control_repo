CPUS="2"
MEMORY="2048"

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "web" do |web|
    web.vm.box = "hashicorp/bionic64"
    web.vm.hostname = "master.puppet.vm"
    web.vm.network "public_network"
    web.vm.provider "virtualbox" do |v|
      v.memory = MEMORY
      v.cpus = CPUS
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "hashicorp/bionic64"
    db.vm.network "public_network"
    db.vm.hostname = "db.puppet.vm"
  end

  config.vm.define "minecraft" do |minecraft|
    minecraft.vm.box = "hashicorp/bionic64"
    minecraft.vm.network "public_network"
    minecraft.vm.hostname  = "minecraft.puppet.vm"
    minecraft.provider "virtualbox" do |v|
      v.memory = MEMORY
      v.cpus = CPUS
    end
  end
end
