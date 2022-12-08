Vagrant.configure("2") do |config|
  config.vm.box = "roboxes/ubuntu2210"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "8192"
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
  config.vm.provision "shell",  privileged: false, inline: <<-SHELL
    git clone https://github.com/brightly-ccv/0
    sudo apt update
    sudo apt upgrade -y
    sudo apt install kubuntu-desktop -y &
    sed -e "6i\sudo kill -9 $!" workaround | cat > workaround.sh
    fg 1
  SHELL
end
# There is also a workaround with the sed script
