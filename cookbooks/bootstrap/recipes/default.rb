["build-essential", "vim", "libshadow-ruby1.8"].map{|p| package p}

user "root" do
  password "$6$fixpt5OK6sKDzI1S$06ZJGbxjOhgdFTLcz.v.uY704pMvxloyUTtPHxGoguklWV..OF1l7XH2lNZUFKSZXdUdqgYWVABbrUS/mMtbZ1" # 12345
end