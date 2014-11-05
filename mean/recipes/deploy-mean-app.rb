node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/current/config/config.js" do
    source "config.js.erb"
    mode '0644'
    owner deploy[:user]
    group deploy[:group]
    variables(
      :replSet => node[:mongodb][:config][:replSet],
      :dbUser => deploy[:db_user],
      :dbPassword => deploy[:db_password]
    )
  end
end