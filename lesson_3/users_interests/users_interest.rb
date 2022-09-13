require "sinatra"
require "sinatra/reloader"
require "yaml"

before do 
  @users = YAML.load_file("users/users.yaml")
end

helpers do 
  def count_interests 
    amount_of_interests = 0 
    @users.each do |user, _|
      amount_of_interests += @users[user][:interests].size
  end
   amount_of_interests
  end  
end

get "/" do 
  redirect "/users"
end 

get "/users" do 
  erb :users 
end

get "/:user_name" do 
  @user_name = params[:user_name].to_sym 
  @email = @users[@user_name][:email] 
  @interests = @users[@user_name][:interests] 

  erb :user 
end 