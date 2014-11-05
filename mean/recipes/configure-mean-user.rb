node[:deploy].each do |application, deploy|
  execute "create-mongodb-app-user" do
    command "/usr/bin/mongo admin --eval \"db.createUser({user:'#{deploy[:db_user]}', pwd:'#{deploy[:db_password]}', roles:[{role:'dbOwner',db:'mean-todo'}]})\""
    action :run
    not_if "/usr/bin/mongo admin --eval \"db.auth({user:'#{deploy[:db_user]}', pwd:'#{deploy[:db_password]}')\" | grep -q ^1$"
  end
end 