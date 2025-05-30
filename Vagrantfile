Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
   #Load balancing
  config.vm.define "lb" do |lb|
   lb.vm.hostname = "lb"
   lb.vm.network "forwarded_port", guest: 80, host: 8088
   lb.vm.network "private_network", ip: "192.168.56.10" 
   lb.vm.provision "shell", path: "Scripts/setup_lb.sh"
   lb.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "1024"
    end
  end
  #Server_Web_master
  config.vm.define "web1" do |web1|
   web1.vm.hostname = "ws-master"
   web1.vm.network "forwarded_port", guest: 81, host: 8081
   web1.vm.network "private_network", ip: "192.168.56.20" 
   web1.vm.provision "shell", path: "Scripts/setup_web_1.sh"
   web1.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
    end 
  end
  #Server_Web_slave
  config.vm.define "web2" do |web2|
   web2.vm.hostname = "ws-slave"
   web2.vm.network "forwarded_port", guest: 82, host: 8082
   web2.vm.network "private_network", ip: "192.168.56.30" 
   web2.vm.provision "shell", path: "Scripts/setup_web_2.sh"
   web2.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
    end 
  end  
  #Server_db_master
  config.vm.define "db1" do |db1|
    db1.vm.hostname = "db-master"
    db1.vm.network "private_network", ip: "192.168.56.40" 
    db1.vm.provision "shell", path: "Scripts/setup_db_master.sh"
    db1.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
     end 
   end  
  #Server_db_slave
  config.vm.define "db2" do |db2|
    db2.vm.hostname = "db-slave"
    db2.vm.network "private_network", ip: "192.168.56.50" 
    db2.vm.provision "shell", path: "Scripts/setup_db_slave.sh"
    db2.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
     end 
   end  
  #Server_minintoring
  config.vm.define "mon" do |mon|
    mon.vm.hostname = "monitoring-srv"
    mon.vm.network "forwarded_port", guest: 9090, host: 9091
    mon.vm.network "private_network", ip: "192.168.56.60" 
    mon.vm.provision "shell", path: "Scripts/setup_monitoring.sh"
    mon.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
     end 
   end  
  #Machine cliente
  config.vm.define "test" do |test|
    test.vm.hostname = "test"
    test.vm.network "private_network", ip: "192.168.56.70" 
    test.vm.provision "shell", path: "Scripts/user.sh"
    test.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
     end 
   end 

end