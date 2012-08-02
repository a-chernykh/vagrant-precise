["build-essential", "vim", "libshadow-ruby1.8", "git", "git-core", "screen", "htop"].map{|p| package p}

gem_package "ruby-shadow"

chef_gem "chef-sudo"
require "chef-sudo"

# root password

user "root" do
  password "$6$fixpt5OK6sKDzI1S$06ZJGbxjOhgdFTLcz.v.uY704pMvxloyUTtPHxGoguklWV..OF1l7XH2lNZUFKSZXdUdqgYWVABbrUS/mMtbZ1" # 12345
end

# install dotfiles

install_dotfiles_path = "/usr/local/dotfiles"

git install_dotfiles_path do
  repository "https://github.com/AndreyChernyh/dotfiles.git"
  reference "master"
  action :sync
end

["root", "vagrant"].each do |user|
  sudo "install_dotfiles" do
    user user
    cwd install_dotfiles_path
    command <<-EOS
    ./install.sh; true
    EOS
    simulate_initial_login true
  end
end