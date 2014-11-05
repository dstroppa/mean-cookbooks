if platform?("ubuntu")
  package "mongodb-clients" do
		action :install	
	end
elsif platform?("amazon")   
  package "mongo-10gen" do
		action :install	
	end
end